// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class WebPage extends WebPageBase {
  WebPage(
    this.webPageController, {
    Key? key,
    String? title = '',
    this.coverImage,
    this.coverBanner,
    this.accessBar,
    this.bottomBar,
  }) : super(webPageController, key: key, title: title);
  final WebPageController webPageController;
  final String? coverImage;
  final bool? coverBanner;
  final bool? accessBar;
  final bool? bottomBar;

  /// Main Content
  List<Widget> children05(BuildContext context) =>
      webPageController.children05(context, this);

  /// Main content
  List<Widget>? children04(BuildContext context) =>
      webPageController.children04(context, this);

  /// Website's header
  List<Widget>? children03(BuildContext context) =>
      webPageController.children03(context, this);

  List<Widget>? children02(BuildContext context) =>
      webPageController.children02(context, this);

  List<Widget>? children01(BuildContext context) =>
      webPageController.children01(context, this);
}

/// Controller
class WebPageController extends WebPageBaseController {
  WebPageController({
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
  }) : super(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
          physics: physics,
        );

  @override
  void initState() {
    super.initState();
    // This function gets called repeatedly. StatefulWidget gets rebuilt?
    _widget = widget as WebPage;
  }

  WebPage? _widget;

  /// Possible Screen overlay
  @override
  StackWidgetProperties? screenOverlay(BuildContext context) => null;

  @override
  Widget? child(BuildContext context, [WebPage? widget]) {
    // Supply the 'parent' StatefulWidget.
    widget ??= _widget;

    Widget? _child;

    final _screenSize = screenSize;

    List<Widget> widgets;

    try {
      /// children05
      widgets = children05(context, _widget);
    } catch (ex, stack) {
      widgets = [];
      FlutterError.reportError(FlutterErrorDetails(
        exception: ex,
        stack: stack,
        library: 'web_page.dart',
        context: ErrorDescription('widgets = children04(context)'),
      ));
      // Make the error known if under development.
      if (App.inDebugger) {
        rethrow;
      }
    }

    // No content was generated;
    if (widgets.isEmpty) {
      //
      final FlutterErrorDetails details = FlutterErrorDetails(
        exception: Exception('No web content was supplied?'),
        library: 'web_page.dart',
        context: ErrorDescription(
            "Please, look to the 'controller' for providing content."),
      );

      FlutterError.reportError(details);
      // Notify the developer. Leave 'blank' in production.
      if (App.inDebugger) {
        _child = ErrorWidget.builder(details);
      }
    } else {
      //
      if (widget?.bottomBar ?? true) {
        widgets.addAll([
          SizedBox(height: _screenSize.height / 10),
          const BottomBar(),
        ]);
      }
      _child = Column(
        children: widgets,
      );
    }
    return _child;
  }

  /// Main Content
  List<Widget> children05(BuildContext context, [WebPage? widget]) {
    final List<Widget> children = [];
    List<Widget>? widgets;
    try {
      widgets = children03(context, widget);
    } catch (ex) {
      widgets = null;
      // Announce the error if under development
      if (App.inDebugger) {
        rethrow;
      }
    }
    // Introduce a Stack widget if children03 was implemented.
    if (widgets != null && widgets.isNotEmpty) {
      /// children03
      children.add(
        Stack(
          children: widgets,
        ),
      );
    }
    try {
      /// children04
      widgets = children04(context, widget);
    } catch (ex) {
      widgets = null;
      // Announce the error if under development
      if (App.inDebugger) {
        rethrow;
      }
    }
    if (widgets != null && widgets.isNotEmpty) {
      children.addAll(widgets);
    }
    return children;
  }

  /// Main content
  List<Widget>? children04(BuildContext context, [WebPage? widget]) => null;

  /// Website's header
  List<Widget>? children03(BuildContext context, [WebPage? widget]) {
    final _screenSize = screenSize;
    List<Widget>? widgets;
    try {
      widgets = children02(context, widget);
    } catch (ex) {
      widgets = null;
    }
    return [
      if (!inSmallScreen && (_widget!.coverBanner ?? true))
        SizedBox(
          height: _screenSize.height * 0.45,
          width: _screenSize.width,
          child: Image.asset(
            _widget!.coverImage ?? 'assets/images/earthNetworked.jpg',
            fit: BoxFit.cover,
          ),
        ),
      if (widgets != null && widgets.isNotEmpty)
        Column(
          /// children02
          children: widgets,
        ),
    ];
  }

  List<Widget>? children02(BuildContext context, [WebPage? widget]) {
    List<Widget>? widgets;
    try {
      widgets = children01(context, widget);
    } catch (ex) {
      widgets = null;
    }
    return [
      if (!inSmallScreen && (_widget!.accessBar ?? true))
        FloatingQuickAccessBar(screen: _widget!),
      if (widgets != null && widgets.isNotEmpty)
        Column(
          /// children01
          children: widgets,
        ),
    ];
  }

  List<Widget>? children01(BuildContext context, [WebPage? widget]) => null;
}

class WebPageWrapper extends WebPage {
  WebPageWrapper({
    Key? key,
    Widget? child,
    this.children,
    String title = '',
    WebPageController? controller,
    String? coverImage,
    bool coverBanner = true,
    bool accessBar = true,
    bool bottomBar = true,
    List<Widget>? Function(BuildContext context)? persistentFooterButtons,
    Widget? Function(BuildContext context)? drawer,
    DrawerCallback? Function(BuildContext context)? onDrawerChanged,
    Widget? Function(BuildContext context)? endDrawer,
    DrawerCallback? Function(BuildContext context)? onEndDrawerChanged,
    Widget? Function(BuildContext context)? bottomNavigationBar,
    Widget? Function(BuildContext context)? bottomSheet,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
  })  : assert(child != null || (children != null && children.isNotEmpty)),
        _child = child,
        super(
          controller ??
              WebPageControllerWrapper(
                persistentFooterButtons: persistentFooterButtons,
                drawer: drawer,
                onDrawerChanged: onDrawerChanged,
                endDrawer: endDrawer,
                onEndDrawerChanged: onEndDrawerChanged,
                bottomNavigationBar: bottomNavigationBar,
                bottomSheet: bottomSheet,
                backgroundColor: backgroundColor,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                primary: primary,
                drawerDragStartBehavior: drawerDragStartBehavior,
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                drawerScrimColor: drawerScrimColor,
                drawerEdgeDragWidth: drawerEdgeDragWidth,
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
                restorationId: restorationId,
                physics: physics,
              ),
          key: key,
          title: title,
          coverImage: coverImage,
          coverBanner: coverBanner,
          accessBar: accessBar,
          bottomBar: bottomBar,
        );
  final Widget? _child;
  final List<Widget>? children;

  @override
  List<Widget>? children04(BuildContext context, [WebPage? widget]) => children;

  @override
  Widget child(context) => _child ?? super.child(context)!;
}

class WebPageControllerWrapper extends WebPageController {
  WebPageControllerWrapper({
    List<Widget>? Function(BuildContext context)? persistentFooterButtons,
    Widget? Function(BuildContext context)? drawer,
    DrawerCallback? Function(BuildContext context)? onDrawerChanged,
    Widget? Function(BuildContext context)? endDrawer,
    DrawerCallback? Function(BuildContext context)? onEndDrawerChanged,
    Widget? Function(BuildContext context)? bottomNavigationBar,
    Widget? Function(BuildContext context)? bottomSheet,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
  }) : super(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
          physics: physics,
        ) {
    _persistentFooterButtons = persistentFooterButtons;
    _drawer = drawer;
    _onDrawerChanged = onDrawerChanged;
    _endDrawer = endDrawer;
    _onEndDrawerChanged = onEndDrawerChanged;
    _bottomNavigationBar = bottomNavigationBar;
    _bottomSheet = bottomSheet;
  }

  @override
  void initState() {
    super.initState();
    // This function gets called repeatedly. StatefulWidget gets rebuilt?
    _wrapper = widget as WebPageWrapper;
  }

  WebPageWrapper? _wrapper;

  /// Supply the widget's function instead.
  @override
  List<Widget>? children04(BuildContext context, [WebPage? widget]) =>
      _wrapper!.children;

  /// Supply the widget's function instead.
  @override
  Widget? child(BuildContext context, [WebPage? widget]) =>
      _wrapper!._child ?? super.child(context)!;

  List<Widget>? Function(BuildContext context)? _persistentFooterButtons;
  Widget? Function(BuildContext context)? _drawer;
  DrawerCallback? Function(BuildContext context)? _onDrawerChanged;
  Widget? Function(BuildContext context)? _endDrawer;
  DrawerCallback? Function(BuildContext context)? _onEndDrawerChanged;
  Widget? Function(BuildContext context)? _bottomNavigationBar;
  Widget? Function(BuildContext context)? _bottomSheet;

  @override
  List<Widget>? persistentFooterButtons(BuildContext context) =>
      _persistentFooterButtons == null
          ? null
          : _persistentFooterButtons!(context);

  @override
  Widget? drawer(BuildContext context) =>
      _drawer == null ? null : _drawer!(context);

  @override
  DrawerCallback? onDrawerChanged(BuildContext context) =>
      _onDrawerChanged == null ? null : _onDrawerChanged!(context);

  @override
  Widget? endDrawer(BuildContext context) =>
      _endDrawer == null ? null : _endDrawer!(context);

  @override
  DrawerCallback? onEndDrawerChanged(BuildContext context) =>
      _onEndDrawerChanged == null ? null : _onEndDrawerChanged!(context);

  @override
  Widget? bottomNavigationBar(BuildContext context) =>
      _bottomNavigationBar == null ? null : _bottomNavigationBar!(context);

  @override
  Widget? bottomSheet(BuildContext context) =>
      _bottomSheet == null ? null : _bottomSheet!(context);
}

/// Popup window
/// Provides an animated popup.
class PopupPage extends WebPage {
  PopupPage({
    Key? key,
    required this.builder,
    String? title,
    String? coverImage,
    bool? coverBanner,
    bool? accessBar,
    bool? bottomBar,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
  }) : super(
          BuilderPageController(
            builder: builder,
            bottomBar: bottomBar ?? false,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            primary: primary,
            drawerDragStartBehavior: drawerDragStartBehavior,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            drawerScrimColor: drawerScrimColor,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
            restorationId: restorationId,
            physics: physics,
          ),
          key: key,
          title: title,
          coverImage: coverImage,
          coverBanner: coverBanner,
          accessBar: accessBar ?? false,
          bottomBar: bottomBar ?? false,
        );
  final WidgetBuilder builder;

  @override
  String get title => '';

  @override
  Widget child(BuildContext context) => builder(context);

  /// Create a popup window
  static Future<T?> window<T>(
    BuildContext parentContext,
    WidgetBuilder child, {
    String? title,
    String? coverImage,
    bool? coverBanner,
    bool? accessBar,
    bool? bottomBar,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
    Curve? curve,
  }) async {
    final T? result = await Navigator.of(parentContext).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => PopupPage(
          builder: (_) => child(parentContext),
          title: title,
          coverImage: coverImage,
          coverBanner: coverBanner,
          accessBar: accessBar,
          bottomBar: bottomBar,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
          physics: physics,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final rectAnimation = _createTween(parentContext)
              .chain(CurveTween(curve: curve ?? Curves.ease))
              .animate(animation);
          return Stack(
            children: [
              PositionedTransition(rect: rectAnimation, child: child),
            ],
          );
        },
      ),
    );
    return result;
  }

  /// Define the transition used in the animation
  ///
  //todo: If context is null?
  static Tween<RelativeRect> _createTween(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    final rect = box.localToGlobal(Offset.zero) & box.size;
    final relativeRect =
        RelativeRect.fromSize(rect, MediaQuery.of(context).size);
    return RelativeRectTween(
      begin: relativeRect,
      end: RelativeRect.fill,
    );
  }
}

/// Passing a Widget builder to the Webpage Controller.
class BuilderPageController extends WebPageController {
  BuilderPageController({
    required this.builder,
    bool? bottomBar,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
    ScrollPhysics? physics,
  })  : _bottomBar = bottomBar ?? true,
        super(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
          physics: physics,
        );
  final bool _bottomBar;
  final WidgetBuilder builder;

  @override
  List<Widget>? children04(BuildContext context, [WebPage? widget]) =>
      _bottomBar ? [builder(context)] : null;

  @override
  List<Widget> children05(BuildContext context, [WebPage? widget]) =>
      !_bottomBar ? [builder(context)] : super.children05(context);
}
