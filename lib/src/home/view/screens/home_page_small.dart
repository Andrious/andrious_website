// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/main.dart';
import 'package:andrious/src/view.dart';

class HomePageSmall extends WebPage {
  factory HomePageSmall({Key? key}) => _this ??= HomePageSmall._(key);
  HomePageSmall._(Key? key)
      : super(
          HomePageSmallController(
              physics: const AlwaysScrollableScrollPhysics()),
          key: key,
          coverBanner: false,
          accessBar: false,
          bottomBar: true,
        );
  static HomePageSmall? _this;

  @override
  String get title => 'Andrious Solutions Ltd.';
}

class HomePageSmallController extends WebPageController {
  HomePageSmallController({ScrollPhysics? physics}) : super(physics: physics);

  @override
  void initState() {
    //
    super.initState();

    // Determine if an overlay is to be displayed.
    showOverlay = Prefs.getBool('showOverlay', true);
    projects = HowProjectsWork(showPopup: false, readMore: true);
    useCase = UseCaseExample(readMore: true, banner: false, bottomBar: false);
    paradox = ProgrammingParadox(
      readMore: true,
      coverBanner: false,
      bottomBar: false,
    );
    disclose = InitialDisclosure(banner: false);
    scrollController.addListener(() {
      final offset = scrollController.offset;
      if (offset > _lastOffset) {
        // print('Down: $offset');
      } else {
        // print('Up: $offset');
      }
      _lastOffset = offset;
    });
    flutterUIs = FlutterUIs();

    _widget = widget as HomePageSmall;
  }

  late HomePageSmall _widget;

  late HowProjectsWork projects;
  late UseCaseExample useCase;
  late ProgrammingParadox paradox;
  late InitialDisclosure disclose;
  late FlutterUIs flutterUIs;
  late bool showOverlay;

  double _lastOffset = 0;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        backgroundColor:
            Theme.of(context).bottomAppBarColor.withOpacity(opacity),
        elevation: 0,
        centerTitle: true,
        // actions: [
        //   if (inSmallScreen) AppTheme.fontSizeButton,
        //   // SizedBox(width: MyApp.screenSize.width * 0.1),
        //   // AppTheme.darkModeButton,
        // ],
        title: Text(
          _widget.title,
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      );

  @override
  StackWidgetProperties? screenOverlay(BuildContext context) {
    //
//    final con = controller as HomePageSmallController;

    // Don't continue if the overlay is not to be shown.
    if (!showOverlay) {
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
                child: Text(
                  msg,
                  style: const TextStyle(height: 1),
                ),
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
                      setOverlay(shown: false);
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
  List<Widget> children04(BuildContext context, [WebPage? widget]) {
    final _screenSize = MyApp.screenSize;
    final _smallScreen = inSmallScreen;
    final List<Widget> children = [];
    children.addAll(projects.children05(context));
    children.add(projects.popup(context, showLink: false));
    children.add(useCase.child(context, useCase)!);
//    children.addAll(paradox.children04(context)!);
    children.add(paradox.child(context, paradox)!);
    children.add(
      Padding(
        padding: EdgeInsets.only(top: _screenSize.height * 0.2, bottom: 32),
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
    if (!_smallScreen) {
      children.add(const ArticleCarousel());
    }
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
    if (!_smallScreen) {
      children.add(DartPackages());
    }
    children.addAll(disclose.children05(context));

    children.add(flutterUIs.coverPage(
      context,
      onTap: () async {
        const url = 'https://github.com/lohanidamodar/flutter_ui_challenges/';
        if (await canLaunch(url)) {
          await launch(url);
        }
      },
    ));
    return children;
  }

  Future<bool> setOverlay({bool shown = true}) {
    showOverlay = shown;
    return Prefs.setBool('showOverlay', shown);
  }
}
