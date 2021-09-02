// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomeScreen extends WebPageBase {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget? child(BuildContext context) => null;

  /// Provide the body of the webpage
  @override
  Widget body(BuildContext context) {
    panelList = generatePanelList();
    Widget overlayWidget;
    late Color color;
    double rad;

    return ScrollyWidget(
      showDebugConsole: true,
      guidelinePosition: GuidelinePosition.center,
      opacity: 0.5,
      panels: panelList,
      panelProgressCallback: (activePanelNumber, progress, func) {
        //
        rad = (progress! <= 0.5) ? progress * 200 : 200 - progress * 200;

        switch (activePanelNumber) {
          case 1:
            {
              color = Colors.purple;
              break;
            }
          case 2:
            {
              color = Colors.green;
              break;
            }
          case 3:
            {
              color = Colors.red;
              break;
            }
          case 4:
            {
              color = Colors.pink;
              break;
            }
          case 5:
            {
              color = Colors.purple;
              break;
            }
          case 6:
            {
              color = Colors.limeAccent;
              break;
            }
          case 7:
            {
              color = Colors.green;
              break;
            }
          case 8:
            {
              color = Colors.purple;
              break;
            }
          case 9:
            {
              color = Colors.green;
              break;
            }
          case 10:
            {
              color = Colors.red;
              break;
            }
          case 11:
            {
              color = Colors.pink;
              break;
            }
          case 12:
            {
              color = Colors.purple;
              break;
            }
          case 13:
            {
              color = Colors.limeAccent;
              break;
            }
          case 14:
            {
              color = Colors.green;
              break;
            }
        }

        overlayWidget = Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(rad),
              ),
              color: color,
            ),
          ),
        );

        func(overlayWidget);
      },
      panelStartCallback: (activePanelNumber, func) {
        print('panel start callback $activePanelNumber');
      },
      panelEndCallback: (endingPanelNumber, func) {
        print('panel end callback $endingPanelNumber');
      },
      lastPanelForceComplete: true,
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
//      ResponsiveWidget.isSmallScreen(context)
      true
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
                'Andrious Solutions Ltd.',
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
}

List<Widget> panelList = [];

List<Widget> generatePanelList() {
  final List<Widget> list = [];
  for (int i = 0; i < 20; i++) {
    list.add(Center(
      child: Column(
        children: <Widget>[
          Container(
            height: (100 * ((i + 1) % 9) + 100).toDouble(),
            color: (i % 2 == 0) ? Colors.blue : Colors.orange,
            child: Center(child: Text('Panel ${i + 1}')),
          ),
        ],
      ),
    ));
  }
  return list;
}
