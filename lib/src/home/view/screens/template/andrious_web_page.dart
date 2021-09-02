// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

abstract class WebPage extends WebPageBase {
  const WebPage({Key? key, this.bottomBar = true}) : super(key: key);

  final bool bottomBar;

  /// Supply a title
  String get title;

  List<Widget> children05(BuildContext context) {
    final Size _screenSize = screenSize!;
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
    final Size _screenSize = screenSize!;
    List<Widget>? widgets;
    try {
      widgets = children02(context);
    } catch (ex) {
      widgets = null;
    }
    return [
      SizedBox(
        height: _screenSize.height * 0.45,
        width: _screenSize.width,
        child: Image.asset(
          'assets/images/earhNetworked.jpg',
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
      FloatingQuickAccessBar(screenSize: _screenSize),
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
}
