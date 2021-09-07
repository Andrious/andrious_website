// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

import 'package:andrious/src/controller.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;

/// The 'framework' of a typical Material Screen.
class ScaffoldScreenWidget extends BasicStatefulWidget {
  const ScaffoldScreenWidget(this._controller, {Key? key})
      : super(key: key, controller: _controller);

  final ScaffoldScreenController _controller;

  /// Provide a appBar
  PreferredSizeWidget? appBar(BuildContext context) => null;

  /// Called in its State object's initState() function
  /// To be overridden and used by subclasses
  @override
  void initWidget() => _controller.initWidget();

  /// Implement the build() function here instead.
  @override
  Widget build(BuildContext context) => _controller.build(context);
}

abstract class ScaffoldScreenController extends ControllerMVC {
  /// Provide a appBar
  PreferredSizeWidget? appBar(BuildContext context);

  /// Initialize the widget
  void initWidget();

  /// Provide the body of the Scaffold widget
  Widget? body(BuildContext context);

  List<Widget>? persistentFooterButtons(BuildContext context);

  Widget? drawer(BuildContext context);

  DrawerCallback? onDrawerChanged(BuildContext context);

  Widget? endDrawer(BuildContext context);

  DrawerCallback? onEndDrawerChanged(BuildContext context);

  Widget? bottomNavigationBar(BuildContext context);

  Widget? bottomSheet(BuildContext context);

  Color? backgroundColor;

  bool? resizeToAvoidBottomInset;

  bool? primary;

  DragStartBehavior? drawerDragStartBehavior;

  bool? extendBody;

  bool? extendBodyBehindAppBar;

  Color? drawerScrimColor;

  double? drawerEdgeDragWidth;

  bool? drawerEnableOpenDragGesture;

  bool? endDrawerEnableOpenDragGesture;

  String? restorationId;

  BasicStatefulWidget? widget;
  Size? screenSize;
  double? opacity;

  Widget build(BuildContext context) {
    widget = state!.widget as BasicStatefulWidget?;
    screenSize = widget!.screenSize;
    opacity = widget!.opacity;
    return Scaffold(
      appBar: appBar(context) ??
          PreferredSize(
              preferredSize: Size(screenSize!.width, 1000),
              child: TopBarContents(opacity!)),
      body: body(context),
      drawer: drawer(context),
      onDrawerChanged: onDrawerChanged(context),
      endDrawer: endDrawer(context),
      onEndDrawerChanged: onEndDrawerChanged(context),
      bottomNavigationBar: bottomNavigationBar(context),
      bottomSheet: bottomSheet(context),
      backgroundColor: backgroundColor,
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
}
