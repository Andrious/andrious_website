// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

abstract class WebPage<T> extends WebPageBase {
  WebPage({
    Key? key,
    WebPageController? controller,
    this.coverImage,
    this.accessBar = true,
    this.bottomBar = true,
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
            controller: controller ??
                _WebPageController<T>(
                  persistentFooterButtons,
                  drawer,
                  onDrawerChanged,
                  endDrawer,
                  onEndDrawerChanged,
                  bottomNavigationBar,
                  bottomSheet,
                  backgroundColor: backgroundColor,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                  primary: primary,
                  drawerDragStartBehavior: drawerDragStartBehavior,
                  extendBody: extendBody,
                  extendBodyBehindAppBar: extendBodyBehindAppBar,
                  drawerScrimColor: drawerScrimColor,
                  drawerEdgeDragWidth: drawerEdgeDragWidth,
                  drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                  endDrawerEnableOpenDragGesture:
                      endDrawerEnableOpenDragGesture,
                  restorationId: restorationId,
                  physics: physics,
                ),
            key: key);

  final String? coverImage;
  final bool accessBar;
  final bool bottomBar;

  /// Supply a title
  String get title;

  List<Widget> children05(BuildContext context) {
    final List<Widget> children = [];
    List<Widget>? widgets;
    try {
      widgets = children03(context);
    } catch (ex) {
      widgets = null;
    }
    if (widgets != null) {
      /// children03
      children.add(Stack(children: widgets));
    }
    try {
      /// children04
      widgets = children04(context);
    } catch (ex) {
      widgets = null;
    }
    if (widgets != null) {
      children.addAll(widgets);
    }
    return children;
  }

  List<Widget>? children04(BuildContext context) => null;

  List<Widget>? children03(BuildContext context) {
    List<Widget>? widgets;
    try {
      widgets = children02(context);
    } catch (ex) {
      widgets = null;
    }
    return [
      SizedBox(
        height: screenSize!.height * 0.45,
        width: screenSize!.width,
        child: Image.asset(
          coverImage ?? 'assets/images/earthNetworked.jpg',
          fit: BoxFit.cover,
        ),
      ),
      if (widgets != null)
        Column(
          /// children02
          children: widgets,
        ),
    ];
  }

  List<Widget>? children02(BuildContext context) {
    final Size _screenSize = screenSize!;
    List<Widget>? widgets;
    try {
      widgets = children01(context);
    } catch (ex) {
      widgets = null;
    }
    return [
      if (!isSmallScreen && accessBar)
        FloatingQuickAccessBar(
          screenSize: _screenSize,
        ),
      if (widgets != null)
        Column(
          /// children01
          children: widgets,
        ),
    ];
  }

  List<Widget>? children01(BuildContext context) => null;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          )
        ],
      );

  @override
  Widget child(BuildContext context) {
    List<Widget> widgets;
    try {
      widgets = children05(context);
    } catch (ex) {
      widgets = [];
    }
    if (bottomBar) {
      widgets.addAll([
        SizedBox(height: screenSize!.height / 10),
        const BottomBar(),
      ]);
    }
    return Column(
      children: widgets,
    );
  }

  @override
  bool get isSmallScreen => _smallScreen ??= super.isSmallScreen;
  static bool? _smallScreen;
}

class WebPageController<T extends WebPageBase> extends WebPageBaseController {
  //
  @override
  void initState() {
    _widget = state!.widget as T?;
    super.initState();
  }

  T? _widget;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => _widget?.appBar(context);

  @override
  Widget? child(BuildContext context) => _widget?.child(context) ?? Container();

  @override
  void initWidget() {
    // TODO: implement initWidget
  }
}

class _WebPageController<T> extends WebPageController {
  _WebPageController(
    this._persistentFooterButtons,
    this._drawer,
    this._onDrawerChanged,
    this._endDrawer,
    this._onEndDrawerChanged,
    this._bottomNavigationBar,
    this._bottomSheet, {
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
  }) {
    this.backgroundColor = backgroundColor;
    this.resizeToAvoidBottomInset = resizeToAvoidBottomInset;
    this.primary = primary;
    this.drawerDragStartBehavior = drawerDragStartBehavior;
    this.extendBody = extendBody;
    this.extendBodyBehindAppBar = extendBodyBehindAppBar;
    this.drawerScrimColor = drawerScrimColor;
    this.drawerEdgeDragWidth = drawerEdgeDragWidth;
    this.drawerEnableOpenDragGesture = drawerEnableOpenDragGesture;
    this.endDrawerEnableOpenDragGesture = endDrawerEnableOpenDragGesture;
    this.restorationId = restorationId;
    this.physics = physics;
  }

  final List<Widget>? Function(BuildContext context)? _persistentFooterButtons;
  final Widget? Function(BuildContext context)? _drawer;
  final DrawerCallback? Function(BuildContext context)? _onDrawerChanged;
  final Widget? Function(BuildContext context)? _endDrawer;
  final DrawerCallback? Function(BuildContext context)? _onEndDrawerChanged;
  final Widget? Function(BuildContext context)? _bottomNavigationBar;
  final Widget? Function(BuildContext context)? _bottomSheet;

  // @override
  // PreferredSizeWidget? appBar(BuildContext context) => _widget?.appBar(context);
  //
  // @override
  // Widget? child(BuildContext context) => _widget?.child(context) ?? Container();

  @override
  void initWidget() {
    // TODO: implement initWidget
  }

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
