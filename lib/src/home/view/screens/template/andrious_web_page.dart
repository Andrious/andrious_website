// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

abstract class WebPage extends WebPageBase {
  const WebPage({Key? key, this.bottomBar = true}) : super(key: key);

  final bool bottomBar;

  /// Supply a title
  String get title;

  /// Supply the 'children' for this Andrious webpage.
  List<Widget> children(BuildContext context);

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
      widgets = children(context);
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
