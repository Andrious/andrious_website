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
                  AppRouterDelegate.nextRoute(
                    {'/use_case': (context) => const UseCaseExample()},
                  );
                },
              ),
              const BottomBarColumn(
                heading: 'HELP',
                s1: 'Payment',
                s2: 'Cancellation',
                s3: 'FAQ',
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
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          if (smallScreen) const SizedBox(height: 20),
          if (smallScreen)
            const InfoText(
              type: '',
              text: 'info@andrioussolutions.com',
            ),
          if (smallScreen) const SizedBox(height: 5),
          if (smallScreen)
            const InfoText(
              type: '',
              text: 'Winnipeg, MB  CANADA',
            ),
          if (smallScreen) const SizedBox(height: 20),
          if (smallScreen)
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          if (!smallScreen)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                color: Colors.blueGrey,
                width: double.maxFinite,
                height: 1,
              ),
            ),
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
