// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

/// The 'framework' of a typical Material Screen.
abstract class ScaffoldScreenAbstract extends BasicStatefulWidget {
  const ScaffoldScreenAbstract({
    Key? key,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary,
    this.drawerDragStartBehavior,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  }) : super(key: key);

  /// Provide a appBar
  PreferredSizeWidget? appBar(BuildContext context);

  /// Provide the body of the Scaffold widget
  Widget? body(BuildContext context);

  List<Widget>? persistentFooterButtons(BuildContext context);

  Widget? drawer(BuildContext context);

  DrawerCallback? onDrawerChanged(BuildContext context);

  Widget? endDrawer(BuildContext context);

  DrawerCallback? onEndDrawerChanged(BuildContext context);

  Widget? bottomNavigationBar(BuildContext context);

  Widget? bottomSheet(BuildContext context);

  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? primary;
  final DragStartBehavior? drawerDragStartBehavior;
  final bool? extendBody;
  final bool? extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final String? restorationId;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context) ??
            PreferredSize(
                preferredSize: Size(screenSize!.width, 1000),
                child: TopBarContents(opacity)),
        body: body(context),
        drawer: drawer(context),
        onDrawerChanged: onDrawerChanged(context),
        endDrawer: endDrawer(context),
        onEndDrawerChanged: onEndDrawerChanged(context),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: primary ?? true,
        drawerDragStartBehavior:
            drawerDragStartBehavior ?? DragStartBehavior.start,
        extendBody: extendBody ?? false,
        extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture ?? true,
        restorationId: restorationId,
      );
}

/// The base
abstract class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget({Key? key}) : super(key: key);

  /// Implement the build() function here instead.
  Widget build(BuildContext context);

  /// Determine the current screen size.
  Size? get screenSize {
    Size? size;

    final context = state?.context;

    if (context != null) {
      size = MediaQuery.of(context).size;
    }
    return size;
  }

  /// The State object's Scroll Controller
  ScrollController? get scrollController {
    final BasicState? webPageState = state as BasicState;
    return webPageState?._scrollController;
  }

  /// The State object's Scroll Position
  double get scrollPosition {
    final BasicState? webPageState = state as BasicState;
    return webPageState?._scrollPosition ?? 0;
  }

  /// The State object's current opacity.
  double get opacity {
    final BasicState? webPageState = state as BasicState;
    return webPageState?._opacity ?? 0;
  }

  @override
  State createState() => BasicState();
}

class BasicState extends State<BasicStatefulWidget> with StateSet {
  //
  late ScrollController _scrollController;
  late Size screenSize;
  double _scrollPosition = 0;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  /// Call the parent's build() function to make this work.
  @override
  Widget build(BuildContext context) {
    //
    screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return widget.build(context);
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }
}
