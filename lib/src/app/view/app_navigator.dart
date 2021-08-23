// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with PopNavigatorRouterDelegateMixin<AppRoutePath> {
  AppRouterDelegate(
    this.state, {
    required this.home,
    this.add,
    this.builder,
    this.remove,
    this.setPath,
  }) : _navigatorKey = GlobalKey<NavigatorState>() {
    _this = this;
  }

  static late AppRouterDelegate _this;

  final State state;
  final WidgetBuilder home;
  final void Function(VoidCallback listener)? add;
  final Widget Function(BuildContext context)? builder;
  final void Function(VoidCallback listener)? remove;
  final Future<void> Function(dynamic configuration)? setPath;
  final GlobalKey<NavigatorState>? _navigatorKey;

  static String? _path = '/';
  static late List<MaterialPage<dynamic>> _pages;

  /// Of course, You're free to override this function if you like
  /// This getter will update the current URL path
  @override
  AppRoutePath get currentConfiguration => _parseRoutePath(_path);

  /// Of course, You're free to override this function if you like
  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return builder!(context);
    } else {
      // Use a StatefulWidget is the logic isn't repeatedly called (it's in the State object)
      return _PageList(delegate: this);
    }
  }

  /// Of course, You're free to override this function if you like
  @override
  void addListener(VoidCallback listener) {
    if (add != null) {
      add!(listener);
    } else {}
  }

  /// Of course, You're free to override this function if you like
  @override
  void removeListener(VoidCallback listener) {
    if (remove != null) {
      remove!(listener);
    } else {}
  }

  /// Of course, You're free to override this function if you like
  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (setPath != null) {
      await setPath!(configuration);
    } else {
      // Supply the 'id' (whatever that is) to this Delegator.
      if (configuration.isHomePage) {
        _path = configuration.path;
      } else if (configuration.isWebPage) {
        _path = configuration.path;
        refresh();
      } else {
        _path = AppRoutePath.unknown().path;
        refresh();
      }
    }
  }

  /// Of course, You're free to override this function if you like
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  void refresh() {
    if (state.mounted) {
      state.setState(() {});
    }
  }

  MaterialPage<dynamic>? materialPage(
    String path,
    WidgetBuilder builder, {
    bool? maintainState,
    bool? fullscreenDialog,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) {
    final _PageListState? state =
        StateSet.stateOf<_PageList>() as _PageListState;
    return state?.materialPage(
      path,
      builder,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      key: key,
      name: name,
      arguments: arguments,
      restorationId: restorationId,
    );
  }

  /// Supply the next route
  static void nextRoute(
    final Map<String, WidgetBuilder>? routes, {
    bool? maintainState,
    bool? fullscreenDialog,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) {
    //
    routes?.forEach((path, builder) {
      _pages.add(
        _this.materialPage(
          path,
          builder,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          key: key,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
        )!,
      );
    });

    _this.setNewRoutePath(_parseRoutePath(_pages.last.name));
  }
}

/// Parser inspired by https://github.com/acoutts/flutter_nav_2.0_mobx/blob/master/lib/main.dart
/// Converts a route into the user class type, <T>
/// Using typed information instead of string allows for greater flexibility
class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  //
  @override
  Future<AppRoutePath> parseRouteInformation(
          RouteInformation routeInformation) async =>
      _parseRoutePath(routeInformation.location);

  /// Restore to the current configuration
  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) =>
      RouteInformation(location: configuration.path, state: configuration);
}

/// Return the appropriate AppRoutePath object with it's specific URL
AppRoutePath _parseRoutePath(String? path) {
  // Supply the current path if null
  path ??= AppRouterDelegate._path;

  final uri = Uri.parse(path!);

  if (uri.pathSegments.isEmpty) {
    return AppRoutePath.home();
  }

  // Handle '/book/:id'
  if (uri.pathSegments.length == 2) {
    //
    if (!uri.pathSegments[0].startsWith('/')) {
      return AppRoutePath.unknown();
    }

    final remaining = uri.pathSegments[1];

    if (remaining.isEmpty) {
      return AppRoutePath.unknown();
    }
    return AppRoutePath.page(remaining);
  } else if (uri.pathSegments.length == 1) {
    //
    return AppRoutePath.page(uri.path);
  }
  // Handle unknown routes
  return AppRoutePath.unknown();
}

/// Of course, You're free to override this class if you like
class AppRoutePath {
  //
  AppRoutePath.home()
      : path = '/',
        isUnknown = false,
        isHomePage = true,
        isWebPage = false;

  AppRoutePath.page(this.path)
      : isUnknown = false,
        isHomePage = false,
        isWebPage = true;

  AppRoutePath.unknown()
      : path = '/404',
        isUnknown = true,
        isHomePage = false,
        isWebPage = false;

//  final AppRouteState? state;
  final String? path;
  final bool isUnknown;
  final bool isHomePage;
  final bool isWebPage;
}

// /// Of course, You're likely to override this class conveying your app's current state.
// mixin AppRouteState<T extends StatefulWidget> on State<T> {
//   String? path;
//
//   // Override so you don't call if not mounted in the Widget tree.
//   @override
//   void setState(VoidCallback fn) {
//     // Don't bother if the State object is disposed of.
//     if (mounted) {
//       super.setState(fn);
//     }
//   }
// }

class _PageList extends StatefulWidget {
  const _PageList({required this.delegate, Key? key}) : super(key: key);
  final AppRouterDelegate delegate;
  @override
  State createState() => _PageListState();
}

class _PageListState extends State<_PageList> with StateSet {
  @override
  void initState() {
    //
    super.initState();

    // AppRouterDelegate._pages = listPages(
    //   context,
    //   widget.delegate.routes,
    //   widget.delegate.pages,
    // );

    final page = materialPage('/', widget.delegate.home);

    AppRouterDelegate._pages = [page];
  }

  @override
  Widget build(BuildContext context) {
    final pages = AppRouterDelegate._pages;
    return Navigator(
      key: widget.delegate.navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        //
        final pop = route.didPop(result);

        if (pop) {
          //
          Navigator.pop(context);

          // // Update the list of pages by setting _selectedVeggie to null
          // _selectedVeggie = null;
          // show404 = false;
          // notifyListeners();
          widget.delegate.state.setState(() {});
        }
        return pop;
      },
    );
  }

  /// Returns a MaterialPage object.
  MaterialPage<dynamic> materialPage(
    String path,
    WidgetBuilder builder, {
    bool? maintainState,
    bool? fullscreenDialog,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) {
    Widget? widget;

    try {
      widget = builder(context);
    } catch (ex) {
      // Those in error are not included!
      widget = null;
      assert(widget != null, '$builder generated an error!');
    }

    return MaterialPage<void>(
      maintainState: maintainState ?? true,
      fullscreenDialog: fullscreenDialog ?? true,
      key: ValueKey('$path/${widget.toString()}'),
      name: path,
      arguments: arguments,
      restorationId: restorationId,
      child: widget ?? Container(),
    );
  }

  // Return a list of pages to be used by this app
  List<Page<dynamic>> listPages(
    BuildContext? context,
    Map<String, WidgetBuilder>? routes,
    List<MaterialPage<dynamic>>? pages,
  ) {
    //
    final Map<String, Page<dynamic>> _pages = {};

    if (routes != null) {
      //
      routes.forEach((path, widgetBuilder) {
        //
        Widget? widget;

        try {
          widget = widgetBuilder(context!);
        } catch (ex) {
          // Those in error are not included!
          widget = null;

          // Remove that entry, it's no good.
          routes.remove(path);

          assert(widget != null, '$widgetBuilder generated an error!');
        }

        // The widget may error
        // The path may be repeated
        if (widget != null) {
          //
          var newPath = path.trim();

          if (newPath.isEmpty || !newPath.startsWith('/')) {
            // Correct the path key.
            widgetBuilder = routes.remove(path)!;
            newPath = '/$newPath';
            routes[newPath] = widgetBuilder;
          }

          if (_pages.containsKey(newPath)) {
            // Remove the duplicate.
            routes.remove(newPath);
          } else {
            //
            _pages[path] = MaterialPage<void>(
              fullscreenDialog: true,
              key: ValueKey('$path/${widget.toString()}'),
              name: newPath,
              child: widget,
            );
          }
        }
      });
    }

    // Any MaterialPage objects come secondary
    if (pages != null) {
      //
      for (MaterialPage<dynamic> page in pages) {
        //
        var path = page.name;

        // It must have a path and key specified.
        if (page.key == null || path == null || path.isEmpty) {
          late String key;

          if (path == null || path.isEmpty) {
            path = page.toString().toLowerCase();
            key = path;
          } else {
            path = path.trim();
            key = '$path/${page.toString()}';
          }

          // Create a new MaterialPage with a path and key.
          page = MaterialPage<void>(
            child: page.child,
            //ignore: avoid_redundant_argument_values
            maintainState: true,
            // Webpages are always Full Screen Dialogs
            fullscreenDialog: true,
            key: ValueKey(key),
            name: path,
            arguments: page.arguments,
            restorationId: page.restorationId,
          );
        }
        // Always keep the first instance in the map
        if (_pages.containsKey(path)) {
          continue;
        }

        _pages[path] = page;

        routes![path] = (BuildContext context) => page.child;
      }
    }

    var path = AppRoutePath.home().path!;

    // If a 'home' page is not specified, use the first one in the list.
    if (_pages.isNotEmpty && !_pages.containsKey(path)) {
      //
      final entry = _pages.entries.first;

      final value = _pages.remove(entry.key);

      final page = value as MaterialPage<dynamic>;

      // Create a new MaterialPage with a path and key.
      _pages[path] = MaterialPage<void>(
        child: page.child,
        //ignore: avoid_redundant_argument_values
        maintainState: true,
        // Webpages are always Full Screen Dialogs
        fullscreenDialog: true,
        key: ValueKey('$path/${page.child.toString()}'),
        name: path,
        arguments: page.arguments,
        restorationId: page.restorationId,
      );
    }

    path = AppRoutePath.unknown().path!;

    if (_pages.isNotEmpty && !_pages.containsKey(path)) {
      //
      const widget = UnknownScreen();

      _pages[path] = MaterialPage<void>(
        fullscreenDialog: true,
        key: ValueKey('$path/${widget.toString()}'),
        name: path,
        child: widget,
      );
    }

    return [
      _pages['/']!,
      if (AppRouterDelegate._path != '/') _pages[AppRouterDelegate._path]!,
    ];
  }
}
