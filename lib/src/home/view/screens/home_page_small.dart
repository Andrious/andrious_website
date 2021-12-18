// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePageSmall extends WebPage {
  factory HomePageSmall({Key? key}) => _this ??= HomePageSmall._(key);
  HomePageSmall._(Key? key)
      : super(
          HomePageSmallController(
              physics: const AlwaysScrollableScrollPhysics()),
          key: key,
          coverBanner: false,
          hasAccessBar: false,
          hasBottomBar: true,
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
    useCase = UseCaseExample(readMore: true, banner: false);
    paradox = ProgrammingParadox(
        readMore: true, coverBanner: false, hasBottomBar: false);
    disclose = InitialDisclosure(banner: false);

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

    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

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
  List<Widget> withHeader04(BuildContext context, [WebPage? widget]) {
    final _screenSize = screenSize;
    final _smallScreen = inSmallScreen;
    final List<Widget> children = [];
    children.addAll(projects.withBottomBar05(context));
    children.add(projects.popup(context, showLink: false));
    children.addAll(useCase.child(context, useCase)!);
//    children.addAll(paradox.children04(context)!);
    children.addAll(paradox.child(context, paradox)!);

    if (_smallScreen) {
      children.add(const ArticlesLink());
    } else {
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
      children.add(const ArticleCarousel());
    }

    if (_smallScreen) {
      children.add(const PackagesLink());
    } else {
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
    }

    children.addAll(disclose.withBottomBar05(context));

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

  @override
  Column? bottomBar(BuildContext context, [WebPage? widget]) {
    final smallScreen = App.inSmallScreen;
    final textStyle = TextStyle(color: Colors.blueGrey[300], fontSize: 14);
    return Column(
      children: [
        if (!smallScreen)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact Me',
                onPressedS1: () {},
                s2: 'Privacy Policy',
                onPressedS2: () {
                  AppRouterDelegate.nextRoute('/privacy');
                },
                s3: 'Use Case Example',
                onPressedS3: () {
                  AppRouterDelegate.nextRoute('/use_case');
                },
              ),
              BottomBarColumn(
                heading: 'HELP',
                s1: 'How Projects Really Work',
                onPressedS1: () {
                  AppRouterDelegate.nextRoute('/projects_work');
                },
                s2: 'Disclosure Agreement',
                onPressedS2: () {
                  AppRouterDelegate.nextRoute('/disclosure');
                },
                s3: 'The Programming Paradox',
                onPressedS3: () {
                  AppRouterDelegate.nextRoute('/paradox');
                },
              ),
              BottomBarColumn(
                heading: 'SOCIAL',
                s1: 'GITTER',
                onPressedS1: () {
                  MyApp.browseUri('https://gitter.im/Andrious/community/');
                },
                s2: 'LinkedIn',
                onPressedS2: () {
                  MyApp.browseUri('https://www.linkedin.com/in/gregtfperry/');
                },
                s3: 'YouTube',
                onPressedS3: () {
                  MyApp.browseUri(
                      'https://www.youtube.com/channel/UCRrXfoeIX-vpGTc89PDltOA/');
                },
              ),
              if (!smallScreen)
                Container(
                  color: Colors.blueGrey,
                  width: 2,
                  height: 150,
                ),
              if (!smallScreen)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoText(
                      type: '',
                      text: 'info@andrioussolutions.com',
                      selectable: true,
                    ),
                    SizedBox(height: 5),
                    InfoText(
                      type: '',
                      text: 'Winnipeg, MB  CANADA',
                    )
                  ],
                ),
            ],
          ),
        if (smallScreen)
          Column(children: [
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
            const SizedBox(height: 20),
            const InfoText(
              type: '',
              text: 'info@andrioussolutions.com',
              selectable: true,
            ),
            const SizedBox(height: 5),
            const InfoText(
              type: '',
              text: 'Winnipeg, MB  CANADA',
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          ]),
        const SizedBox(height: 20),
        if (!smallScreen)
          Text(
            'v. ${App.version}    Copyright © 2021 | Andrious Solutions Ltd.',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          )
        else
          Column(children: [
            Text(
              'v. ${App.version}    Copyright © 2021',
              style: textStyle,
            ),
            Text(
              'Andrious Solutions Ltd.',
              style: textStyle,
            ),
          ]),
      ],
    );
  }
}
