import 'package:andrious/src/view.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the screen's size.
//    final smallScreen = ResponsiveWidget.isSmallScreen(context);
    final smallScreen = MyApp.inSmallScreen;
    final textStyle = TextStyle(color: Colors.blueGrey[300], fontSize: 14);
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
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
      ),
    );
  }
}
