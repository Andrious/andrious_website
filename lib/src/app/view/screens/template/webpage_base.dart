// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

abstract class WebPageBase extends ScaffoldScreenWidget {
  WebPageBase({WebPageBaseController? controller, Key? key})
      : super(controller ?? _WebPageBaseController(), key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context);

  /// The 'child' widget containing the core of the screen's content.
  Widget? child(BuildContext context);

  /// Determine if running on a small screen.
  bool get isSmallScreen {
    final WebPageBaseController con = controller as WebPageBaseController;
    return con.isSmallScreen!;
  }
}

abstract class WebPageBaseController extends ScaffoldScreenController {
  //
  /// The 'child' widget containing the core of the screen's content.
  Widget? child(BuildContext context);

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
          controller: scrollController!,
          physics: physics ?? const ClampingScrollPhysics(),
          child: child(context) ?? Container(),
        ),
      );

  /// The State object's Scroll Controller
  ScrollController? get scrollController {
    if (_scrollController == null) {
      final BasicState? webPageState = state as BasicState;
      _scrollController = webPageState?.scrollController;
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

  ScrollPhysics? physics;

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
          MyApp.useSmallScreen || MediaQuery.of(context).size.width < 800;
    }
    return _smallScreen;
  }
}

class _WebPageBaseController extends WebPageBaseController {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget? child(BuildContext context) => null;

  @override
  void initWidget() {
    // TODO: implement initWidget
  }
}
