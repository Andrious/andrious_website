// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePage extends WebPage {
  const HomePage({Key? key}) : super(key: key);

  @override
  // TODO: implement title
  String get title => 'Andrious Solutions Ltd.';

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(opacity),
              elevation: 0,
              centerTitle: true,
              actions: const [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: AppTheme.toggleMode,
                ),
              ],
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize!.width, 1000),
              child: TopBarContents(opacity),
            );

  @override
  List<Widget> children01(BuildContext context) {
    final Size _screenSize = screenSize!;
    return [
      FeaturedHeading(
        screenSize: _screenSize,
      ),
      FeaturedTiles(screenSize: _screenSize)
    ];
  }

  @override
  List<Widget> children04(BuildContext context) {
    final Size _screenSize = screenSize!;
    final List<Widget> children = [];
    children.add(DestinationHeading(screenSize: _screenSize));
    children.add(const DestinationCarousel());
    return children;
  }
}
