import 'package:andrious/src/view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel>
    with WebPageBaseMixin {
  //
  final String imagePath = 'assets/images/carousel';

  late Map<String, dynamic> webPages;

  late CarouselController _controller;

  final List<bool> _isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int _current = 0;
  bool tapTwo = false;

  @override
  void initState() {
    super.initState();

    _controller = CarouselController();

    webPages = {
      // 'assets/images/asia.jpg',
      // 'assets/images/africa.jpg',
      // 'assets/images/how_projects_work.jpg',
      // 'assets/images/south_america.jpg',
      // 'assets/images/australia.jpg',
      // 'assets/images/antarctica.jpg',
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
        false,
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
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final smallScreen = ResponsiveWidget.isSmallScreen(context);
    final screenWidth =
        smallScreen ? screenSize.width / 8 : screenSize.width / 8;
    final screenHeight =
        smallScreen ? screenSize.height / 25 : screenSize.height / 50;
    final imageSliders = _generateImageTiles(webPages);
    final _webPages = webPages.keys.toList();
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            height: 450,
            aspectRatio: 18 / 8,
            scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            enlargeCenterPage: true,
            autoPlay: !tapTwo,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                tapTwo = false;
                // for (int i = 0; i < imageSliders.length; i++) {
                //   if (i == index) {
                //     _isSelected[i] = true;
                //   } else {
                //     _isSelected[i] = false;
                //   }
                // }
              });
            },
          ),
          carouselController: _controller,
        ),
        // AspectRatio(
        //   aspectRatio: 18 / 8,
        //   child: Center(
        //     child: Text(
        //       places[_current],
        //       style: TextStyle(
        //         letterSpacing: 8,
        //         fontFamily: 'Electrolize',
        //         fontSize: screenSize.width / 25,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              if (!tapTwo) {
                tapTwo = true;
                await _controller.animateToPage(_current);
                _controller.stopAutoPlay();
              } else {
                tapTwo = false;
                final free = webPages[_webPages[_current]][0];
                final url = webPages[_webPages[_current]][1];
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
                  await uriBrowse(url);
                }
                setState(() {
                  _controller.nextPage();
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
          fit: BoxFit.cover,
        ),
      );
      widgets.add(widget);
    });
    return widgets;
  }
}
