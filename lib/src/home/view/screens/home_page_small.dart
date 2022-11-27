// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePageSmall extends WebPage {
  HomePageSmall({GlobalKey? key})
      : super(
          key: key ?? LabeledGlobalKey('HomePageSmall'),
          title: 'Andrious Solutions Ltd.',
          addFooter: true,
          physics: const AlwaysScrollableScrollPhysics(),
          screenOverlay: CookiesOverlay(),
        );

  @override
  PreferredSizeWidget? onAppBar() => AppBar(
        backgroundColor:
            Theme.of(state!.context).bottomAppBarColor.withOpacity(opacity),
        elevation: 0,
        centerTitle: true,
        title: Text(
          title ?? '',
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
  Widget builder(BuildContext context) {
    final _screenSize = context.screenSize;
    final _smallScreen = context.inSmallScreen;
    final projects = HowProjectsWork(showPopup: false, readMore: true);
    final List<Widget> children = [];
    children.add(Shrine().builder(context));
    children.add(const SizedBox(height: 50));
    children.add(Bazaar().builder(context));
    children.add(CompanyHistory().builder(context));
    children.add(projects.builder(context));
    children.add(projects.popup(context, showLink: false));
    children.add(UseCaseExample(readMore: true).builder(context));
    children.add(
        ProgrammingParadox(readMore: true, addFooter: false).builder(context));

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
                ),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(Icons.grid_on),
                  onPressed: () {
                    AppRouterDelegate.newRoute('/articles');
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
                    AppRouterDelegate.newRoute('/packages');
                  },
                ),
              ),
          ],
        ),
      );
      children.add(DartPackages());
    }

    children.add(InitialDisclosure(banner: false).builder(context));

    children.add(FlutterUIs().coverPage(
      context,
      onTap: () async {
        const url = 'https://github.com/lohanidamodar/flutter_ui_challenges/';
        if (await canLaunch(url)) {
          await launch(url);
        }
      },
    ));

    return Column(children: children);
  }
}

class CookiesOverlay extends ScreenOverlayWidget {
  CookiesOverlay({super.key})
      : super(
          show: App.inDebugger || Prefs.getBool('showOverlay'),
          alignment: AlignmentDirectional.bottomCenter,
        );

  @override
  Widget build(BuildContext context) {
    //
    final _screenSize = context.screenSize;

    final _smallScreen = context.inSmallScreen;

    final String msg = _smallScreen
        ? 'This website uses cookies for your best experience on my website'
        : 'This website uses cookies to ensure you get the best experience on my website.';

    return Padding(
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
                onPressed: () => AppRouterDelegate.newRoute('/privacy'),
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
                      showOverlay = false;
                      Prefs.setBool('showOverlay', showOverlay);
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
  }
}
