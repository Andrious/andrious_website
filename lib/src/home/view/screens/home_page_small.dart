// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/main.dart';
import 'package:andrious/src/view.dart';

class HomePageSmall extends WebPage<HomePageSmall> {
  factory HomePageSmall({Key? key}) => _this ??= HomePageSmall._(key);
  HomePageSmall._(Key? key)
      : super(
          key: key,
          controller: HomePageSmallController<HomePageSmall>(
              physics: const AlwaysScrollableScrollPhysics()),
          coverBanner: false,
          accessBar: false,
          bottomBar: true,
        );
  static HomePageSmall? _this;

  @override
  String get title => 'Andrious Solutions Ltd.';

  @override
  List<Widget> children04(BuildContext context) {
    final con = controller as HomePageSmallController;
    return con.children04(context);
  }

  @override
  StackWidgetProperties? screenOverlay(BuildContext context) {
    //
    final con = controller as HomePageSmallController;

    // Don't cotinue if the overlay is not to be shown.
    if (!con.showOverlay) {
      return null;
    }

    final _screenSize = MyApp.screenSize;
    final _smallScreen = MyApp.inSmallScreen;

    final String msg = _smallScreen
        ? 'This website uses cookies for your best experience on my website'
        : 'This website uses cookies to ensure you get the best experience on my website.';

    final widget = Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        //           height: _scrollerHeight,
        width: _screenSize.width,
        margin: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        child: SizedBox(
          width: _screenSize.width * 0.6,
          height: _screenSize.height * 0.1,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: _screenSize.width * 0.1),
                child: Text(msg),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () => AppRouterDelegate.nextRoute('/privacy'),
                child: Text(
                  _smallScreen ? 'Info' : 'Learn More',
                  style: const TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: _screenSize.width * 0.1),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      con.setOverlay(shown: false);
                      setState(() {});
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
    return StackWidgetProperties(
      alignment: Alignment.bottomRight,
      child: widget,
    );
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

    // Determine if an overlay is to be displayed.
    showOverlay = Prefs.getBool('showOverlay', true);

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
    flutterUIs = FlutterUIs();
  }

  late HowProjectsWork projects;
  late UseCaseExample useCase;
  late ProgrammingParadox paradox;
  late InitialDisclosure disclose;
  late FlutterUIs flutterUIs;
  late bool showOverlay;

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
    children.add(flutterUIs.coverPage(context));
    return children;
  }

  Future<bool> setOverlay({bool shown = true}) {
    showOverlay = shown;
    return Prefs.setBool('showOverlay', shown);
  }
}
