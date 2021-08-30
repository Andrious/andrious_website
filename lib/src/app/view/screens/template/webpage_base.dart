// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

abstract class WebPageBase extends ScaffoldScreenAbstract {
  const WebPageBase({
    Key? key,
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
  }) : super(
          key: key,
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
        );

  /// The 'child' widget containing the core of the screen's content.
  Widget child(BuildContext context);

  /// Provide a appBar
//  PreferredSizeWidget? appBar(BuildContext context);

  /// Provide the body of the webpage
  @override
  Widget body(BuildContext context) => WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 16,
        heightFraction: 0.3,
        controller: scrollController!,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          child: child(context),
        ),
      );

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
}
