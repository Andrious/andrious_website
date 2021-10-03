// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

abstract class WebPageBase extends ScaffoldScreenWidget
    with WebPageFeaturesMixin {
  WebPageBase({WebPageBaseController? controller, Key? key})
      : super(controller ?? _WebPageBaseController(), key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context);

  /// The 'child' widget containing the core of the screen's content.
  Widget? child(BuildContext context);

  /// Possible Screen overlay
  StackWidgetProperties? screenOverlay(BuildContext context);

  /// Determine if running on a small screen.
  bool get isSmallScreen {
    final WebPageBaseController con = controller as WebPageBaseController;
    return con.isSmallScreen!;
  }

  Widget popupScreen(
    BuildContext context, {
    required String title,
    required String text,
    required String name,
    Widget? image,
    bool interactive = true,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment? crossAxisAlignment,
    TextStyle? titleStyle,
    TextStyle? textStyle,
  }) {
    final _screenSize = MyApp.screenSize;
    final _smallScreen = MyApp.inSmallScreen;

    Widget popImage;

    popImage = Image.asset(
      name,
      fit: BoxFit.cover,
    );

    if (interactive) {
      popImage = InteractiveViewer(
        maxScale: 3,
        minScale: 1,
        child: popImage,
      );
    }

    return Container(
      margin: margin ??
          EdgeInsets.fromLTRB(
            _screenSize.width * (_smallScreen ? 0 : 0.2),
            _screenSize.height * (_smallScreen ? 0.1 : 0.2),
            _screenSize.width * (_smallScreen ? 0.0 : 0.2),
            _screenSize.height * (_smallScreen ? 0.1 : 0.2),
          ),
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
      padding: padding ?? EdgeInsets.all(_smallScreen ? 10 : 30),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ?? const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 18),
          AutoSizeText(
            text,
            style: textStyle ?? const TextStyle(fontSize: 16),
          ),
          SizedBox(height: _screenSize.height * 0.05),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => PopupPage.window<void>(
              context,
              (_) => Center(
                child: popImage,
              ),
            ),
            child: image ??
                Padding(
                  padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                  child: Image.asset(name),
                ),
          ),
        ],
      ),
    );
  }
}

abstract class WebPageBaseController extends ScaffoldScreenController {
  WebPageBaseController({
    StateMVC? state,
    this.physics,
  })  : _controller = ScrollController(),
        super(state);
  ScrollPhysics? physics;
  final ScrollController _controller;

  //
  /// The 'child' widget containing the core of the screen's content.
  Widget? child(BuildContext context);

  /// Possible Screen overlay
  StackWidgetProperties? screenOverlay(BuildContext context);

  /// Provide a appBar
//  PreferredSizeWidget? appBar(BuildContext context);

  /// Provide the body of the webpage
  @override
  Widget body(BuildContext context) {
    //
    StackWidgetProperties? stackProps;

    Widget? _child;

    /// Retrieve the main content if any.
    _child = child(context);

    Widget? _overlay;

    /// Display the overlay if it exists
    if (_child == null) {
      stackProps = screenOverlay(context);
      _child = stackProps?.child;
    } else {
      stackProps = screenOverlay(context);
      _overlay = stackProps?.child;
    }

    /// If there is indeed content to be displayed.
    if (_child != null) {
      //
      _child = SingleChildScrollView(
        controller: scrollController ?? _controller,
        physics: physics ?? const ClampingScrollPhysics(),
        child: _child,
      );

      ///
      if (_overlay != null) {
        _child = Stack(
          alignment: stackProps?.alignment ?? AlignmentDirectional.topStart,
          textDirection: stackProps?.textDirection,
          fit: stackProps?.fit ?? StackFit.loose,
          clipBehavior: stackProps?.clipBehavior ?? Clip.hardEdge,
          children: [
            _child,
            _overlay,
          ],
        );
      }
    }
    return WebScrollbar(
      color: Colors.blueGrey,
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      width: 16,
      heightFraction: 0.3,
      controller: scrollController ?? _controller,
      child: _child ?? const SizedBox(),
    );
  }

  /// The State object's Scroll Controller
  ScrollController? get scrollController {
    if (_scrollController == null) {
      final _state = state;
      if (_state != null) {
        _scrollController = (_state as BasicState).scrollController;
      }
    }
    return _scrollController;
  }

  ScrollController? _scrollController;

  /// Clean up
  @override
  void dispose() {
    _scrollController = null;
    super.dispose();
  }

  @override
  List<Widget>? persistentFooterButtons(BuildContext context) => null;

  @override
  Widget? drawer(BuildContext context) => null;

  @override
  DrawerCallback? onDrawerChanged(BuildContext context) => null;

  @override
  Widget? endDrawer(BuildContext context) => null;

  @override
  DrawerCallback? onEndDrawerChanged(BuildContext context) => null;

  @override
  Widget? bottomNavigationBar(BuildContext context) => null;

  @override
  Widget? bottomSheet(BuildContext context) => null;

  bool? _smallScreen;

  /// Determine if running on a small screen.
  bool? get isSmallScreen {
    //
    if (_smallScreen != null) {
      return _smallScreen;
    }

    final context = state?.context;

    if (context == null) {
      _smallScreen = true;
    } else {
      _smallScreen =
          MyApp.inSmallScreen || MediaQuery.of(context).size.width < 800;
    }
    return _smallScreen;
  }
}

class _WebPageBaseController extends WebPageBaseController {
  _WebPageBaseController([StateMVC? state]) : super(state: state);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  /// Possibly overlay displayed on top of the screen.
  @override
  StackWidgetProperties? screenOverlay(
    BuildContext context, {
    AlignmentGeometry? alignment,
    TextDirection? textDirection,
    StackFit? fit,
    Clip? clipBehavior,
  }) =>
      null;

  /// Possibly the main content on the screen.
  @override
  Widget? child(BuildContext context) => null;

  @override
  void initWidget() {
    // TODO: implement initWidget
  }
}

/// Containing standard functionality for a typical webpage.
mixin WebPageFeaturesMixin {
  //
  Future<bool> uriBrowse(
    String? uri, {
    bool? forceSafariVC,
    bool? forceWebView,
    bool? enableJavaScript,
    bool? enableDomStorage,
    bool? universalLinksOnly,
    Map<String, String>? headers,
    Brightness? statusBarBrightness,
    String? webOnlyWindowName,
  }) async {
    //
    bool browse;
    //   if (await canLaunch(url)) {
    if (uri == null) {
      browse = false;
    } else {
      try {
        await launch(
          uri,
          forceSafariVC: forceSafariVC,
          forceWebView: forceWebView ?? false,
          enableJavaScript: enableJavaScript ?? false,
          enableDomStorage: enableDomStorage ?? false,
          universalLinksOnly: universalLinksOnly ?? false,
          headers: headers ?? const <String, String>{},
          statusBarBrightness: statusBarBrightness,
          webOnlyWindowName: webOnlyWindowName,
        );
        browse = true;
      } catch (e) {
        browse = false;
      }
    }
    return browse;
  }
}

class FractionallySizedWidget extends StatelessWidget {
  const FractionallySizedWidget({
    Key? key,
    required this.widthFactor,
    required this.child,
  }) : super(key: key);
  final double widthFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) => Expanded(
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: widthFactor,
          child: child,
        ),
      );
}

class StackWidgetProperties {
  StackWidgetProperties({
    this.alignment,
    this.textDirection,
    this.fit,
    this.clipBehavior,
    required this.child,
  });
  final AlignmentGeometry? alignment;
  final TextDirection? textDirection;
  final StackFit? fit;
  final Clip? clipBehavior;
  final Widget? child;
}
