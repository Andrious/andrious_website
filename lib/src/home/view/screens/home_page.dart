// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePage extends WebPage {
  HomePage({GlobalKey? key})
      : super(
          key: key ?? LabeledGlobalKey('HomePage'),
          title: 'Andrious Solutions Ltd.',
        );

  @override
  PreferredSizeWidget? onAppBar() => inSmallScreen
      ? AppBar(
          backgroundColor:
              Theme.of(context).bottomAppBarColor.withOpacity(opacity),
          elevation: 0,
          centerTitle: true,
          actions: [
            if (inSmallScreen) AppTheme.fontSizeButton,
            SizedBox(width: screenSize.width * 0.1),
            AppTheme.darkModeButton,
          ],
          title: Text(
            title!,
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
  Widget? builder(BuildContext context) {
    final List<Widget> children = [];

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
    return Column(children: children);
  }
}
