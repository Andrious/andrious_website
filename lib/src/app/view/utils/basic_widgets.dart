// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/controller.dart';

import 'package:andrious/src/view.dart';

/// The base
abstract class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget({Key? key, this.controller}) : super(key: key);

  final ControllerMVC? controller;

  /// Called in its State object's initState() function
  /// To be overridden and used by subclasses
  void initWidget() {}

  /// Implement the build() function here instead.
  Widget build(BuildContext context);

  /// Determine the current screen size.
  Size? get screenSize {
    final BasicState? basicState = StateSet.to<BasicState>();
    return basicState?._screenSize;
  }

  /// The State object's Scroll Controller
  ScrollController? get scrollController {
    final BasicState? basicState = StateSet.to<BasicState>();
    return basicState?.scrollController;
  }

  /// The State object's Scroll Position
  double get scrollPosition {
    final BasicState? basicState = StateSet.to<BasicState>();
    return basicState?._scrollPosition ?? 0;
  }

  /// The State object's current opacity.
  double get opacity {
    final BasicState? basicState = StateSet.to<BasicState>();
    return basicState?._opacity ?? 0;
  }

  @override
  State createState() => BasicState(controller);
}

class BasicState extends StateMVC<BasicStatefulWidget> with StateSet {
  BasicState(ControllerMVC? _controller) : super(_controller);
  //
  final ScrollController scrollController = ScrollController();
  late Size _screenSize;
  double _scrollPosition = 0;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    widget.initWidget();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  /// Call the parent's build() function to make this work.
  @override
  Widget build(BuildContext context) {
    //

    _screenSize = MediaQuery.of(context).size;

    /// Determine if the app is running in a small screen.
    MyApp.isSmallScreen(size: _screenSize);

    _opacity = _scrollPosition < _screenSize.height * 0.40
        ? _scrollPosition / (_screenSize.height * 0.40)
        : 1;

    return widget.build(context);
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.offset;
    });
    assert(() {
      //ignore: avoid_print
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$_scrollPosition');
      return true;
    }());
  }
}

/// Popup window
/// Provides an animated popup.
class PopupPage extends WebPage<PopupPage> {
  PopupPage({Key? key, required this.builder}) : super(key: key);
  final WidgetBuilder builder;

  @override
  String get title => '';

  @override
  Widget child(BuildContext context) => builder(context);

  /// Create a popup window
  static Future<T?> window<T>(
    BuildContext parentContext,
    WidgetBuilder child, {
    Curve? curve,
  }) async {
    final T? result = await Navigator.of(parentContext).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PopupPage(builder: (_) => child(parentContext)),
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
