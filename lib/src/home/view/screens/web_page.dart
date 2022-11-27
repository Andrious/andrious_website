// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed the Apache License, Version 2.0
// (the "License") that can be found in the LICENSE file.

import 'package:andrious/src/view.dart';

class WebPage extends WebPageWrapper {
  WebPage({
    super.key,
    this.title,
    super.child,
    PreferredSizeWidget? appBar,
    super.body,
    super.screenOverlay,
    super.addFooter,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
    super.scrollDirection,
    super.reverse,
    super.padding,
    super.scrollPrimary,
    super.physics,
    super.scrollController,
    super.dragStartBehavior,
    super.clipBehavior,
    super.keyboardDismissBehavior,
  }) : super(
          appBar: title != null ? AppBar(title: Text(title)) : appBar,
        );

  final String? title;

  @override
  Widget? footer(BuildContext context) {
    final smallScreen = context.inSmallScreen;
    const padding = EdgeInsets.all(30);
    final color = Theme.of(context).bottomAppBarColor;
    final textStyle = TextStyle(color: Colors.blueGrey[300], fontSize: 14);
    final child = Column(
      children: [
        if (!smallScreen)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                // s1: 'Shrine App',
                // onPressedS1: () {
                //   AppRouterDelegate.nextRoute('/shrine');
                // },
                s2: 'Privacy Policy',
                onPressedS2: () {
                  AppRouterDelegate.newRoute('/privacy');
                },
                s3: 'Use Case Example',
                onPressedS3: () {
                  AppRouterDelegate.newRoute('/use_case');
                },
              ),
              BottomBarColumn(
                heading: 'HELP',
                s1: 'How Projects Really Work',
                onPressedS1: () {
                  AppRouterDelegate.newRoute('/projects_work');
                },
                s2: 'Disclosure Agreement',
                onPressedS2: () {
                  AppRouterDelegate.newRoute('/disclosure');
                },
                s3: 'The Programming Paradox',
                onPressedS3: () {
                  AppRouterDelegate.newRoute('/paradox');
                },
              ),
              BottomBarColumn(
                heading: 'SOCIAL',
                s1: 'GITTER',
                onPressedS1: () {
                  MyApp.browseUri('https://gitter.im/Andrious/community/');
                },
                s2: 'LinkedIn',
                onPressedS2: () {
                  MyApp.browseUri('https://www.linkedin.com/in/gregtfperry/');
                },
                s3: 'YouTube',
                onPressedS3: () {
                  MyApp.browseUri(
                      'https://www.youtube.com/channel/UCRrXfoeIX-vpGTc89PDltOA/');
                },
              ),
              if (!smallScreen)
                Container(
                  color: Colors.blueGrey,
                  width: 2,
                  height: 150,
                ),
              if (!smallScreen)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoText(
                      type: '',
                      text: 'info@andrioussolutions.com',
                      selectable: true,
                    ),
                    SizedBox(height: 5),
                    InfoText(
                      type: '',
                      text: 'Winnipeg, MB  CANADA',
                    )
                  ],
                ),
            ],
          ),
        if (smallScreen)
          Column(children: [
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
            const SizedBox(height: 20),
            const InfoText(
              type: '',
              text: 'info@andrioussolutions.com',
              selectable: true,
            ),
            const SizedBox(height: 5),
            const InfoText(
              type: '',
              text: 'Winnipeg, MB  CANADA',
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          ]),
        const SizedBox(height: 20),
        if (!smallScreen)
          Text(
            'v. ${App.version}  Made with Flutter  Copyright © 2022 | Andrious Solutions Ltd.',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          )
        else
          Column(children: [
            Text(
              'v. ${App.version}    Copyright © 2022',
              style: textStyle,
            ),
            Text(
              'Andrious Solutions Ltd.',
              style: textStyle,
            ),
          ]),
      ],
    );
    return Container(
      padding: padding,
      color: color,
      child: child,
    );
  }
}

/// Display a child widget within a predefined Container widget
class WebPageContainer extends StatelessWidget {
  /// The child widget takes precedence but if not there
  /// the builder() function is called.
  const WebPageContainer({Key? key, this.child}) : super(key: key);

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final screenSize = App.screenSize;
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenSize.width * 0.05,
        screenSize.height * 0.05,
        screenSize.width * 0.05,
        screenSize.height * 0.05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: child ?? builder(context) ?? const SizedBox(),
    );
  }

  /// A subclass can override this function.
  Widget? builder(BuildContext context) => null;
}

/// Provide a 'popup' screen.
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
  bool? hasBottomBar,
}) {
  final _screenSize = App.screenSize;
  final _smallScreen = App.inSmallScreen;

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
            hasBottomBar: hasBottomBar,
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

/// Displays a list of child widgets along the bottom of a webpage.
class BottomBar extends StatelessWidget {
  ///
  const BottomBar({Key? key, required this.children}) : super(key: key);

  ///
  final Column children;

  @override
  Widget build(BuildContext context) {
    // Determine the screen's size.
//    final smallScreen = ResponsiveWidget.isSmallScreen(context);
//    final smallScreen = App.inSmallScreen;
//    final textStyle = TextStyle(color: Colors.blueGrey[300], fontSize: 14);
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: children,
    );
  }
}

/// Column
class BottomBarColumn extends StatelessWidget {
  /// Optional callback functions for the list of headings displayed in a column.
  const BottomBarColumn({
    required this.heading,
    this.s1,
    this.onPressedS1,
    this.s2,
    this.onPressedS2,
    this.s3,
    this.onPressedS3,
    Key? key,
  }) : super(key: key);

  ///
  final String heading;

  ///
  final String? s1;

  ///
  final VoidCallback? onPressedS1;

  ///
  final String? s2;

  ///
  final VoidCallback? onPressedS2;

  ///
  final String? s3;

  ///
  final VoidCallback? onPressedS3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (s1 != null) const SizedBox(height: 10),
          if (s1 != null)
            TextButton(
              onPressed: onPressedS1 ?? () {},
              child: Text(
                s1!,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 14,
                ),
              ),
            ),
          if (s2 != null) const SizedBox(height: 5),
          if (s2 != null)
            TextButton(
              onPressed: onPressedS2 ?? () {},
              child: Text(
                s2!,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 14,
                ),
              ),
            ),
          if (s3 != null) const SizedBox(height: 5),
          if (s3 != null)
            TextButton(
              onPressed: onPressedS3 ?? () {},
              child: Text(
                s3!,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Popup window
/// Provides an animated popup.
class PopupPage extends WebPage {
  /// Many options are for the Scaffold Widget.
  PopupPage({
    Key? key,
    required this.inBuilder,
    this.inInitState,
    this.inDispose,
    String? title,
    PreferredSizeWidget? appBar,
    bool? hasBottomBar,
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
          appBar: appBar,
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
          key: key,
          title: title,
          addFooter: hasBottomBar ?? false,
        );

  /// Function builds the child widget
  final WidgetBuilder inBuilder;

  ///
  final void Function()? inInitState;

  ///
  final void Function()? inDispose;

  @override
  void initState() {
    super.initState();

    if (inInitState != null) {
      inInitState!();
    }
  }

  @override
  void dispose() {
    if (inDispose != null) {
      inDispose!();
    }
    super.dispose();
  }

  @override
  Widget? builder(BuildContext context) => inBuilder(context);

  @override
  String get title => '';

  // @override
  // List<Widget>? child(BuildContext context, [WebPageWidget? widget]) =>
  //     [builder(context)];

  /// Create a popup window
  static Future<T?> window<T>(
    BuildContext context,
    WidgetBuilder child, {
    String? title,
    PreferredSizeWidget? appBar,
    bool? hasBottomBar,
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
    State? state,
    Curve? curve,
    void Function()? inInitState,
    void Function()? inDispose,
  }) async {
    final T? result = await Navigator.of(context).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => PopupPage(
          inBuilder: (_) => child(context),
          inInitState: inInitState,
          inDispose: inDispose,
          title: title,
          appBar: appBar,
          hasBottomBar: hasBottomBar,
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
          final rectAnimation = _createTween(context)
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

/// Wrap widget in an Interactive viewer.
Widget interactiveViewer(Widget widget, {bool wrap = true}) {
//
  if (App.inSmallScreen) {
    widget = InteractiveViewer(
      maxScale: 3,
      minScale: 1,
      child: widget,
    );
  }

  if (wrap && widget is! WebPage) {
    widget = WebPage(
      title: ' ',
      child: widget,
    );
  }

  return widget;
}
