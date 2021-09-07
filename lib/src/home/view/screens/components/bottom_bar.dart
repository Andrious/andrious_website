import 'package:andrious/src/view.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the screen's size.
    final smallScreen = ResponsiveWidget.isSmallScreen(context);
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          if (!smallScreen)
            Row(
//                  mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarColumn(
                  heading: 'ABOUT',
                  s1: 'Contact Us',
                  onPressedS1: () {},
                  s2: 'About Us',
                  s3: 'Use Case Example',
                  onPressedS3: () {
                    AppRouterDelegate.nextRoute('/use_case');
                  },
                ),
                BottomBarColumn(
                  heading: 'HELP',
                  s1: 'Payment',
                  s2: 'Disclosure Agreement',
                  onPressedS2: () {
                    AppRouterDelegate.nextRoute('/disclosure');
                  },
                  s3: 'The Programming Paradox',
                  onPressedS3: () {
                    AppRouterDelegate.nextRoute('/paradox');
                  },
                ),
                const BottomBarColumn(
                  heading: 'SOCIAL',
                  s1: 'Twitter',
                  s2: 'Facebook',
                  s3: 'YouTube',
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
          Text(
            'Copyright © 2021 | Andrious Solutions Ltd.',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
