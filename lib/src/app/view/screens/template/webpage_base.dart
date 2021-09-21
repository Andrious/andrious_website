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

  /// Determine if running on a small screen.
  bool get isSmallScreen {
    final WebPageBaseController con = controller as WebPageBaseController;
    return con.isSmallScreen!;
  }
}

abstract class WebPageBaseController extends ScaffoldScreenController {
  WebPageBaseController([StateMVC? state]) : super(state) {
    _controller = ScrollController();
  }
  late ScrollController _controller;

  //
  /// The 'child' widget containing the core of the screen's content.
  Widget? child(BuildContext context);

  /// Provide a appBar
//  PreferredSizeWidget? appBar(BuildContext context);

  /// Provide the body of the webpage
  @override
  Widget body(BuildContext context) {
    return WebScrollbar(
      color: Colors.blueGrey,
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      width: 16,
      heightFraction: 0.3,
      controller: scrollController ?? _controller,
      child: SingleChildScrollView(
        controller: scrollController ?? _controller,
        physics: physics ?? const ClampingScrollPhysics(),
        child: child(context) ?? Center(child: Container()),
      ),
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
  _WebPageBaseController([StateMVC? state]) : super(state);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

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
