import 'package:andrious/src/view.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/art_of_war.jpg',
        width: 797,
        height: 135,
      );

//   @override
//   Widget build(BuildContext context) {
//     final smallScreen = ResponsiveWidget.isSmallScreen(context);
//     return Container(
//       padding: EdgeInsets.only(
//         top: screenSize.height / (smallScreen ? 20 : 10),
//         bottom: screenSize.height / (smallScreen ? 20 : 15),
//       ),
// //      width: screenSize.width,
//       // color: Colors.black,
//
//       child: Text(
//         'Art of War',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: smallScreen ? 24 : 40,
//           fontFamily: 'Montserrat',
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
}
