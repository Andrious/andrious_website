// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePage extends WebPage {
  HomePage({Key? key}) : super(HomePageController(), key: key);

  @override
  String get title => 'Andrious Solutions Ltd.';
}

class HomePageController extends WebPageController {
  factory HomePageController() => _this ??= HomePageController._();
  HomePageController._() : super();
  static HomePageController? _this;

  @override
  void initState() {
    super.initState();
    _widget = widget as HomePage;
  }

  late HomePage _widget;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => inSmallScreen
      ? AppBar(
          backgroundColor:
              Theme.of(context).bottomAppBarColor.withOpacity(opacity),
          elevation: 0,
          centerTitle: true,
          actions: [
            if (inSmallScreen) AppTheme.fontSizeButton,
            SizedBox(width: App.screenSize.width * 0.1),
            AppTheme.darkModeButton,
          ],
          title: Text(
            _widget.title,
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 20,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
          ),
        )
      : PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: TopBarContents(opacity),
        );

  @override
  List<Widget> header01(BuildContext context, [WebPage? widget]) {
    final Size _screenSize = screenSize;
    return [
      FeaturedHeading(
        screenSize: _screenSize,
      ),
      FeaturedTiles(screenSize: _screenSize)
    ];
  }

  @override
  List<Widget> withHeader04(BuildContext context, [WebPage? widget]) {
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
    children.add(const ArticleCarousel());
    return children;
  }
}
