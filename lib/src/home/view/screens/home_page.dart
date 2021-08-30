// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomePage extends WebPage {
  const HomePage({Key? key}) : super(key: key);

  @override
  // TODO: implement title
  String get title => 'Andrious Solutions Ltd.';

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      ResponsiveWidget.isSmallScreen(context)
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

  @override
  List<Widget> children(BuildContext context) {
    final _screenSize = screenSize;
    return [
      Stack(
        children: [
          SizedBox(
            height: _screenSize!.height * 0.45,
            width: _screenSize.width,
            child: Image.asset(
              'assets/images/earhNetworked.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              FloatingQuickAccessBar(screenSize: _screenSize),
              Column(
                children: [
                  FeaturedHeading(
                    screenSize: _screenSize,
                  ),
                  FeaturedTiles(screenSize: _screenSize)
                ],
              ),
            ],
          )
        ],
      ),
      DestinationHeading(screenSize: _screenSize),
      const DestinationCarousel(),
    ];
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   static const String route = '/';
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late ScrollController _scrollController;
//   double _scrollPosition = 0;
//   double _opacity = 0;
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //
//     final screenSize = MediaQuery.of(context).size;
//
//     _opacity = _scrollPosition < screenSize.height * 0.40
//         ? _scrollPosition / (screenSize.height * 0.40)
//         : 1;
//
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       extendBodyBehindAppBar: true,
//       appBar: ResponsiveWidget.isSmallScreen(context)
//           ? AppBar(
//               backgroundColor:
//                   Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
//               elevation: 0,
//               centerTitle: true,
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.brightness_6),
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onPressed: () {
//                     EasyDynamicTheme.of(context).changeTheme();
//                   },
//                 ),
//               ],
//               title: Text(
//                 'Andrious Solutions Ltd.',
//                 style: TextStyle(
//                   color: Colors.blueGrey[100],
//                   fontSize: 20,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 3,
//                 ),
//               ),
//             )
//           : PreferredSize(
//               preferredSize: Size(screenSize.width, 1000),
//               child: TopBarContents(_opacity),
//             ),
//       drawer: const ExploreDrawer(),
//       body: WebScrollbar(
//         color: Colors.blueGrey,
//         backgroundColor: Colors.blueGrey.withOpacity(0.3),
//         width: 16,
//         heightFraction: 0.3,
//         controller: _scrollController,
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           physics: const ClampingScrollPhysics(),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                     height: screenSize.height * 0.45,
//                     width: screenSize.width,
//                     child: Image.asset(
//                       'assets/images/earhNetworked.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       FloatingQuickAccessBar(screenSize: screenSize),
//                       Column(
//                         children: [
//                           FeaturedHeading(
//                             screenSize: screenSize,
//                           ),
//                           FeaturedTiles(screenSize: screenSize)
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               DestinationHeading(screenSize: screenSize),
//               const DestinationCarousel(),
//               SizedBox(height: screenSize.height / 10),
//               const BottomBar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _scrollListener() {
//     setState(() {
//       _scrollPosition = _scrollController.position.pixels;
//     });
//   }
// }
