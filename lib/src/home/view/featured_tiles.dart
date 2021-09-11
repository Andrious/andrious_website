import 'package:andrious/src/view.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/phone_road.jpg',
    'assets/images/phone_trail.jpg',
    'assets/images/phone_mountains.jpg',
  ];

  final List<String> title = ['Trekking', 'Animals', 'Photography'];

  @override
  Widget build(BuildContext context) {
    final smallScreen = ResponsiveWidget.isSmallScreen(context);
    return smallScreen
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SizedBox(width: screenSize.width / 15),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
// //                mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(width: screenSize.width / 15),
//                   ...Iterable<int>.generate(assets.length).map(
//                     (int pageIndex) => Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             print('test');
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: screenSize.width / 2.5,
//                                 width: screenSize.width / 1.5,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.asset(
//                                     assets[pageIndex],
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: screenSize.height / 70,
//                                 ),
//                                 child: Text(
//                                   title[pageIndex],
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w500,
//                                     color: Theme.of(context)
//                                         .primaryTextTheme
//                                         .subtitle1!
//                                         .color,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: screenSize.width / 15),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => InkWell(
                    onTap: () {
                      print('test');
                    },
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.width / 6,
                          width: screenSize.width / 3.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              assets[pageIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 70,
                          ),
                          child: Text(
                            title[pageIndex],
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .subtitle1!
                                  .color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
