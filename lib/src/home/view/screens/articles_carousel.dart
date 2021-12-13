// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArticleCarousel extends StatefulWidget {
  const ArticleCarousel({Key? key}) : super(key: key);

  /// Scroll to position
  static const double offset = 5000;

  @override
  State createState() => _ArticleCarouselState();
}

class _ArticleCarouselState extends State<ArticleCarousel>
    with WebPageFeaturesMixin {
  //
  late CarouselController _carouselController;
  late ArticlesCarouselController _con;
  int _current = 0;
  bool tapTwo = false;

  @override
  void initState() {
    super.initState();
    _smallScreen = App.inSmallScreen;
    _carouselController = CarouselController();
    _con = ArticlesCarouselController();
  }

  late bool _smallScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: _generateImageTiles(_con.webPages),
          options: CarouselOptions(
            height: 450,
            aspectRatio: 18 / 8,
            scrollPhysics: _smallScreen
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            enlargeCenterPage: true,
            autoPlay: !tapTwo,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                tapTwo = false;
              });
            },
          ),
          carouselController: _carouselController,
        ),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              if (!tapTwo) {
                tapTwo = true;
                await _carouselController.animateToPage(_current);
                _carouselController.stopAutoPlay();
              } else {
                tapTwo = false;
                await _con.browse(
                  context: this.context,
                  index: _current,
                  webPage: this,
                );
                setState(() {
                  _carouselController.nextPage();
                });
              }
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _generateImageTiles(Map<String, dynamic> map) {
    final List<Widget> widgets = [];
    map.forEach((image, url) {
      final widget = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          image,
          fit: _smallScreen ? BoxFit.fill : BoxFit.cover,
        ),
      );
      widgets.add(widget);
    });
    return widgets;
  }
}

class ArticlesCarouselController extends WebPageController {
  factory ArticlesCarouselController() =>
      _this ??= ArticlesCarouselController._();
  //
  ArticlesCarouselController._() {
    _webPages = {
      '$imagePath/medium01.jpg': [
        false,
        'https://medium.com/flutter-community/mixin-state-objects-part-2-bdc3b8881b9'
      ],
      '$imagePath/medium02.jpg': [
        false,
        'https://medium.com/flutter-community/a-stateset-class-part-1-2891f1a0eea1'
      ],
      '$imagePath/medium03.jpg': [
        false,
        'https://medium.com/flutter-community/the-pageview-widget-5b887d780e65'
      ],
      '$imagePath/medium04.jpg': [
        false,
        'https://medium.com/flutter-community/the-style-in-flutter-164b3c02a608'
      ],
      '$imagePath/medium05.jpg': [
        false,
        'https://medium.com/flutter-community/navigating-flutter-part-2-244062b3030c'
      ],
      '$imagePath/medium06.jpg': [
        false,
        'https://medium.com/flutter-community/the-key-to-widget-testing-f467a716799a'
      ],
      '$imagePath/medium07.jpg': [
        false,
        'https://medium.com/flutter-community/a-better-flutter-menu-b1472d24a'
      ],
      '$imagePath/medium08.jpg': [
        false,
        'https://medium.com/flutter-community/navigating-flutter-part-1-9cc335d0494c'
      ],
      '$imagePath/medium09.jpg': [
        false,
        'https://medium.com/flutter-community/the-widget-inherited-178ff969c50a'
      ],
      '$imagePath/medium10.jpg': [
        false,
        'https://medium.com/flutter-community/mediaquery-in-flutter-4317d3fe3612'
      ],
      '$imagePath/medium11.jpg': [
        false,
        'https://medium.com/flutter-community/state-management-in-flutter-df291824b309'
      ],
      '$imagePath/medium12.jpg': [
        false,
        'https://medium.com/flutter-community/decode-appbar-4e810020f744'
      ],
      '$imagePath/medium13.jpg': [
        false,
        'https://medium.com/flutter-community/the-context-in-flutter-e2403bab4632'
      ],
      '$imagePath/medium14.jpg': [
        false,
        'https://medium.com/flutter-community/toggle-your-flutter-f8b77abd8fb6'
      ],
      '$imagePath/medium15.jpg': [
        false,
        'https://medium.com/flutter-community/the-state-of-flutter-934fd4e80248'
      ],
      '$imagePath/medium16.jpg': [
        false,
        'https://medium.com/flutter-community/declare-flutter-final-a3a05a34963d'
      ],
      '$imagePath/medium17.jpg': [
        false,
        'https://medium.com/flutter-community/follow-the-rules-in-flutter-fa892dc2ccfa'
      ],
      '$imagePath/medium18.jpg': [
        true,
        'https://medium.com/flutter-community/mvc-design-pattern-in-flutter-4ad6641b7863'
      ],
      '$imagePath/medium19.jpg': [
        false,
        'https://medium.com/flutter-community/decode-textformfield-4b1b9f341554'
      ],
      '$imagePath/medium20.jpg': [
        false,
        'https://medium.com/flutter-community/flutters-dependency-injection-c4f053e4408'
      ],
      '$imagePath/medium21.jpg': [
        false,
        'https://medium.com/follow-flutter/sqlite-in-my-flutter-app-ccf0de38e5fd'
      ],
      '$imagePath/medium22.jpg': [
        false,
        'https://medium.com/follow-flutter/switch-themes-in-my-flutter-app-18826171a474'
      ],
      '$imagePath/medium23.jpg': [
        false,
        'https://medium.com/follow-flutter/error-handling-in-my-flutter-app-1279ec681e90'
      ],
      '$imagePath/medium24.jpg': [
        true,
        'https://medium.com/follow-flutter/an-mvc-approach-to-flutter-f333d6288078'
      ],
      '$imagePath/medium25.jpg': [
        true,
        'https://medium.com/follow-flutter/your-next-mvc-flutter-project-1fabe2069b01'
      ],
      '$imagePath/medium26.jpg': [
        false,
        'https://andrious.medium.com/notifications-in-flutter-2dc4ee6ee6aa'
      ],
      '$imagePath/medium27.jpg': [
        false,
        'https://betterprogramming.pub/hide-your-passwords-e9154bbb8db4'
      ],
      '$imagePath/medium28.jpg': [
        false,
        'https://andrious.medium.com/flutters-cross-platform-approach-f6a0a1c39e11'
      ],
      '$imagePath/medium29.jpg': [
        false,
        'https://andrious.medium.com/notification-alarms-in-flutter-25e3ee3c336e'
      ],
      '$imagePath/medium30.jpg': [
        false,
        'https://andrious.medium.com/cupertino-datetime-picker-b8ee3eadd3cd'
      ],
      '$imagePath/medium31.jpg': [
        false,
        'https://medium.com/flutter-community/an-error-handler-for-flutter-f8f6dc01f06e'
      ],
      '$imagePath/medium32.jpg': [
        false,
        'https://medium.com/flutter-community/error-handling-in-flutter-98fce88a34f0'
      ],
      '$imagePath/medium33.jpg': [
        false,
        'https://medium.com/codechai/search-bar-in-flutter-5aedf2c86b44'
      ],
      '$imagePath/medium34.jpg': [
        false,
        'https://andrious.medium.com/alertdialog-widget-7362c50a7b66'
      ],
      '$imagePath/medium35.jpg': [
        false,
        'https://andrious.medium.com/statefulwidgets-key-state-8ad83ac2e54f'
      ],
      '$imagePath/medium36.jpg': [
        false,
        'https://medium.com/codechai/a-better-bottom-bar-c47dcaf4c730'
      ],
      '$imagePath/medium37.jpg': [
        false,
        'https://andrious.medium.com/decode-gridview-9b123553e604'
      ],
      '$imagePath/medium38.jpg': [
        false,
        'https://andrious.medium.com/ads-in-your-flutter-app-16ad82ce698a'
      ],
      '$imagePath/medium39.jpg': [
        false,
        'https://andrious.medium.com/do-you-speak-a-my-language-587854c2d0a3'
      ],
      '$imagePath/medium40.jpg': [
        true,
        'https://medium.com/follow-flutter/bazaar-in-mvc-41e1c960b5c5'
      ],
      '$imagePath/medium41.jpg': [
        true,
        'https://medium.com/flutter-community/shrine-in-mvc-7984e08d8e6b'
      ],
      '$imagePath/medium42.jpg': [
        false,
        'https://andrious.medium.com/auth-in-flutter-97275b29b550'
      ],
      '$imagePath/medium43.jpg': [
        true,
        'https://medium.com/flutter-community/mvc-in-flutter-part-3-9d6f40cb4a52'
      ],
      '$imagePath/medium44.jpg': [
        true,
        'https://medium.com/flutter-community/mvc-in-flutter-part-2-e5a5cdb73a81'
      ],
      '$imagePath/medium45.jpg': [
        true,
        'https://medium.com/flutter-community/mvc-in-flutter-part-1-51d5eba081a3'
      ],
      '$imagePath/medium46.jpg': [
        false,
        'https://andrious.medium.com/sqlite-database-in-flutter-2ef1ef87e5af'
      ],
      '$imagePath/medium47.jpg': [
        false,
        'https://andrious.medium.com/my-apps-no-good-here-s-why-7699347bb235'
      ],
      '$imagePath/medium48.jpg': [
        false,
        'https://andrious.medium.com/add-ads-in-your-app-in-a-snap-a980d2050ef9'
      ],
      '$imagePath/medium49.jpg': [
        false,
        'https://andrious.medium.com/decode-row-column-8b88ad2d758c'
      ],
      '$imagePath/medium50.jpg': [
        false,
        'https://andrious.medium.com/decode-scaffold-30dcb6913077'
      ],
      '$imagePath/medium51.jpg': [
        false,
        'https://andrious.medium.com/decode-materialapp-b730ee4eaed1'
      ],
      '$imagePath/medium52.jpg': [
        false,
        'https://andrious.medium.com/decode-customscrollview-d5a60fcfb9fb'
      ],
      '$imagePath/medium53.jpg': [
        false,
        'https://andrious.medium.com/decode-listview-a0bc4b90f82d'
      ],
      '$imagePath/medium54.jpg': [
        false,
        'https://andrious.medium.com/decode-streambuilder-e60948629d8e'
      ],
      '$imagePath/medium55.jpg': [
        false,
        'https://andrious.medium.com/decode-futurebuilder-bc1a5e6507d4'
      ],
      '$imagePath/medium56.jpg': [
        true,
        'https://medium.com/follow-flutter/a-design-pattern-for-flutter-db6ccaea2413'
      ],
      '$imagePath/medium57.jpg': [
        true,
        'https://medium.com/follow-flutter/mvc-weather-app-78feaa616b12'
      ],
      '$imagePath/medium58.jpg': [
        false,
        'https://andrious.medium.com/flutter-faster-db1e0fef57ba'
      ],
      '$imagePath/medium59.jpg': [
        false,
        'https://medium.com/follow-flutter/clean-up-all-the-flutter-69cb308382f4'
      ],
      '$imagePath/medium60.jpg': [
        true,
        'https://medium.com/follow-flutter/flutter-mvc-at-last-275a0dc1e730'
      ],
      '$imagePath/medium61.jpg': [
        false,
        'https://andrious.medium.com/a-flutter-class-for-app-preferences-a256166ecc63'
      ],
      '$imagePath/medium62.jpg': [
        false,
        'https://andrious.medium.com/store-and-read-your-apps-preferences-4139e836cfe9'
      ],
    };
    _articles = _webPages.keys.toList(growable: false);
  }
  //
  static ArticlesCarouselController? _this;

  final String imagePath = 'assets/images/carousel';

  /// List of article images
  List<String> get articles => _articles;
  late List<String> _articles;

  /// Map of article webpages
  Map<String, dynamic> get webPages => _webPages;
  late Map<String, dynamic> _webPages;

  Future<void> browse({
    required BuildContext context,
    required int index,
    required WebPageFeaturesMixin webPage,
  }) async {
    //
    final free = webPages[_articles[index]][0];

    final url = webPages[_articles[index]][1];

    bool browse;

    if (!free) {
      browse = await showBox(
        context: context,
        contentPadding: const EdgeInsets.all(10),
        text: '''
This article is behind a paywall on Medium.com.
If you're a member, it's free. If not, you may wish to cancel.
''',
        button01: Option(text: 'Continue', result: true),
        press01: () => browse = true,
      );
    } else {
      browse = true;
    }
    if (browse) {
      await webPage.uriBrowse(url);
    }
  }

  @override
  Widget child(BuildContext context, [WebPage? widget]) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          ),
          child: Material(
            child: GridView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: articles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 3 : 5,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) => ArticleImage(
                this,
                index: index,
                constraints: constraints,
              ),
            ),
          ),
        ),
      );
}

class ArticleImage extends StatelessWidget with WebPageFeaturesMixin {
  const ArticleImage(
    this.con, {
    required this.index,
    required this.constraints,
    Key? key,
  }) : super(key: key);
  final ArticlesCarouselController con;
  final int index;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => PopupPage.window<void>(context, browser),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Image.asset(
          con.articles[index],
          fit: BoxFit.contain,
        ),
      );

  Widget browser(BuildContext context) => Center(
        child: Material(
          child: InkWell(
            onTap: () async {
              await con.browse(
                context: context,
                index: index,
                webPage: this,
              );
            },
            child: interactiveViewer(
              Image.asset(
                con.articles[index],
                fit: BoxFit.cover,
              ),
              wrap: false,
            ),
          ),
        ),
      );
}
