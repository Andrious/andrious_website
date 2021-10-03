// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HomeScreen extends WebPageBase {
  HomeScreen({Key? key}) : super(controller: HomeScreenController(), key: key);

  @override
  StackWidgetProperties? screenOverlay(
    BuildContext context, {
    AlignmentGeometry? alignment,
    TextDirection? textDirection,
    StackFit? fit,
    Clip? clipBehavior,
  }) {
    // TODO: implement screenOverlay
    throw UnimplementedError();
  }

  @override
  Widget? child(BuildContext context) {
    // TODO: implement child
    throw UnimplementedError();
  }
}

class HomeScreenController extends WebPageBaseController {
  //
  @override
  void initWidget() {
    //
    scrollController?.addListener(() {
      final double offset = scrollController!.positions.last.pixels;
      if (offset > _lastOffset) {
//        print('scrolling down');
      } else {
//        print('scrolling up');
      }
      _lastOffset = offset;
    });
  }

  double _lastOffset = 0;

  @override
  StackWidgetProperties? screenOverlay(
    BuildContext context, {
    AlignmentGeometry? alignment,
    TextDirection? textDirection,
    StackFit? fit,
    Clip? clipBehavior,
  }) =>
      null;

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
//      opacity: 0.5,
      opacity: 0,
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
  PreferredSizeWidget? appBar(BuildContext context) => isSmallScreen!
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
          preferredSize: Size(screenSize.width, 1000),
          child: TopBarContents(opacity),
        );

  Color? onBackgroundColor() {
    MaterialColor materialColor = const MaterialColor(0xFF7FFF00, {
      50: Color(0xFFF9FFF3),
      100: Color(0xFFF3FFE6),
      200: Color(0xFFDFFFC0),
      300: Color(0xFFCBFF97),
      400: Color(0xFFA6FF4D),
      500: Color(0xFF7FFF00),
      600: Color(0xFF72E300),
      700: Color(0xFF4D9900),
      800: Color(0xFF3A7300),
      900: Color(0xFF254A00),
    });
  }
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
