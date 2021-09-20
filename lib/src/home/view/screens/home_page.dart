// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePage extends WebPage<HomePage> {
  HomePage({Key? key}) : super(key: key);

  @override
  String get title => 'Andrious Solutions Ltd.';

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
//    children.add(DestinationHeading(screenSize: _screenSize));
//    children.add(SizedBox(height: screenSize!.height * 0.10));
    children.add(
      const Padding(
        padding: EdgeInsets.only(top: 30, bottom: 20),
        child: Text(
          'My Technical Articles',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      ),
    );
    children.add(ArticleCarousel());
    return children;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => isSmallScreen
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
}
