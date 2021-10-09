// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/controller.dart';

import 'package:andrious/src/view.dart';

/// The base
abstract class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget(this._controller, {Key? key}) : super(key: key);

  final BasicController _controller;

  /// Determine the current screen size.
  Size? get screenSize => _controller.screenSize;

  /// The State object's Scroll Controller
  ScrollController? get scrollController => _controller.scrollController;

  /// The State object's Scroll Position
  double get scrollPosition => _controller.scrollPosition;

  /// The State object's current opacity.
  double get opacity => _controller.opacity;

  @override
  State createState() => BasicState(_controller);
}

abstract class BasicController extends ControllerMVC {
  BasicController() : super();

  ScrollController get scrollController => _scrollController!;
  ScrollController? _scrollController;

  double scrollPosition = 0;
  double opacity = 0;

  Size get screenSize => _screenSize;
  late Size _screenSize;

  /// Determine if running on a small screen.
  bool get inSmallScreen => _smallScreen;
  late bool _smallScreen;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _scrollController = null;
    super.dispose();
  }

  /// Supply the widget through the controller.
  BasicStatefulWidget get widget => state!.widget as BasicStatefulWidget;

  /// You must implement the build() function.
  Widget build(BuildContext context);

  /// Constantly note the 'scroll position'
  void _scrollListener() {
    setState(() {
      scrollPosition = scrollController.offset;
    });
    assert(() {
      //ignore: avoid_print
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$scrollPosition');
      return true;
    }());
  }
}

class BasicState extends StateMVC<BasicStatefulWidget> with StateSet {
  BasicState(BasicController _controller) : super(_controller) {
    _con = controller as BasicController;
  }
  //
  late BasicController _con;

  @override
  Widget build(BuildContext context) {
    //
    MyApp.orientation(context);

    _con._screenSize = MediaQuery.of(context).size;

    /// Determine if the app is running in a small screen.
    _con._smallScreen = MyApp.isSmallScreen(size: _con._screenSize);

    _con.opacity = _con.scrollPosition < _con._screenSize.height * 0.40
        ? _con.scrollPosition / (_con._screenSize.height * 0.40)
        : 1;

    return _con.build(context);
  }
}
