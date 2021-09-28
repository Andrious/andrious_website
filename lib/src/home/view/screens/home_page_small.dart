// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/main.dart';
import 'package:andrious/src/view.dart';

class HomePageSmall extends WebPage<HomePageSmall> {
  HomePageSmall({Key? key})
      : super(
            controller: HomePageSmallController<HomePageSmall>(
                physics: const AlwaysScrollableScrollPhysics()),
            key: key);

  @override
  String get title => 'Andrious Solutions Ltd.';

  @override
  List<Widget> children04(BuildContext context) {
    final con = controller as HomePageSmallController;
    return con.children04(context);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => true //isSmallScreen
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

class HomePageSmallController<T> extends WebPageController {
  HomePageSmallController({StateMVC? state, ScrollPhysics? physics})
      : super(state: state, physics: physics);
  @override
  void initWidget() {
    //
    projects = HowProjectsWork();
    useCase = UseCaseExample(bottomBar: false);
    paradox = ProgrammingParadox();
    disclose = InitialDisclosure(banner: false);
    scrollController?.addListener(() {
      final offset = scrollController!.offset;
      if (offset > _lastOffset) {
        // print('Down: $offset');
      } else {
        // print('Up: $offset');
      }
      _lastOffset = offset;
    });
  }

  late HowProjectsWork projects;
  late UseCaseExample useCase;
  late ProgrammingParadox paradox;
  late InitialDisclosure disclose;
  double _lastOffset = 0;

  List<Widget> children04(BuildContext context) {
    final _smallScreen = MyApp.inSmallScreen;
    final List<Widget> children = [];
    children.addAll(projects.children05(context, showPopup: false));
    children.add(projects.popup(context, showLink: false));
    children.add(useCase.child(context));
    children.addAll(paradox.children04(context)!);
    children.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          mainAxisAlignment: _smallScreen
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceAround,
          children: [
            Text(
              _smallScreen ? 'Technical Articles' : 'My Technical Articles',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
//                letterSpacing: 3,
              ),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  AppRouterDelegate.nextRoute('/articles');
                },
              ),
            ),
          ],
        ),
      ),
    );
    children.add(const ArticleCarousel());
    children.add(
      Row(
        mainAxisAlignment: _smallScreen
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceAround,
        children: [
          Text(
            _smallScreen
                ? 'My Own Contribution'
                : 'My Contribution to the Flutter Community',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
          ),
          if (_smallScreen)
            Flexible(
              child: IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  AppRouterDelegate.nextRoute('/packages');
                },
              ),
            ),
        ],
      ),
    );
    children.add(DartPackages());
    children.addAll(disclose.children05(context));
    return children;
  }
}
