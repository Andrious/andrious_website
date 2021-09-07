// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

import 'package:andrious/src/controller.dart';

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
    final BasicState? basicState = state as BasicState;
    return basicState?._screenSize;
  }

  /// The State object's Scroll Controller
  ScrollController? get scrollController {
    final BasicState? basicState = state as BasicState;
    return basicState?.scrollController;
  }

  /// The State object's Scroll Position
  double get scrollPosition {
    final BasicState? basicState = state as BasicState;
    return basicState?._scrollPosition ?? 0;
  }

  /// The State object's current opacity.
  double get opacity {
    final BasicState? basicState = state as BasicState;
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

  /// Call the parent's build() function to make this work.
  @override
  Widget build(BuildContext context) {
    //
    _screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < _screenSize.height * 0.40
        ? _scrollPosition / (_screenSize.height * 0.40)
        : 1;

    return widget.build(context);
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.offset;
    });
  }
}
