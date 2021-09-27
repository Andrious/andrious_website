// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HowProjectsWork extends WebPage<HowProjectsWork> {
  HowProjectsWork({Key? key}) : super(key: key);

  final String _projectsImage = 'assets/images/how_projects_work.jpg';

  static const double offset = 200;

  @override
  // Screen's title
  String get title => 'How Projects Really Work';

  @override
  List<Widget> children05(BuildContext context, {bool showPopup = true}) {
    final _smallScreen = MyApp.inSmallScreen;
    final _howProjectsWork = Image.asset(_projectsImage);
    return [
      Stack(
        children: [
          Center(
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: !_smallScreen
                  ? null
                  : () {
                      if (showPopup) {
                        setState(() {
                          _Content.visible = !_Content.visible;
                        });
                      } else {
                        PopupPage.window<void>(
                          context,
                          (_) => Center(
                            child: Padding(
                              padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                              child: Image.asset(
                                _projectsImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    },
              child: Padding(
                padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                child: _howProjectsWork,
              ),
            ),
          ),
          if (showPopup)
            Visibility(
              visible: _Content.visible,
              // Method is below. Allowing to be called separately.
              child: popup(context, fontSize: 18),
            ),
        ],
      ),
    ];
  }

  Widget popup(BuildContext context, {double? fontSize, bool showLink = true}) {
    final _smallScreen = MyApp.inSmallScreen;
    final _screenSize = MyApp.screenSize;
    final _landscape = MyApp.inLandscape;
    final _textStyle = TextStyle(fontSize: fontSize ?? 16);
    final _treeSwing = Text('Tree Swing', style: _textStyle);
    const String _threeTreesImage = 'assets/images/three_trees.jpg';
    const String _fiveWhysImage = 'assets/images/five_whys.png';
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * (_smallScreen ? 0 : 0.15),
          _screenSize.height * (_smallScreen ? 0 : 0.2),
          _screenSize.width * (_smallScreen ? (_landscape ? 1 : 0) : 0.15),
          _screenSize.height * (_smallScreen ? (_landscape ? 1 : 0.5) : 0.2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 2),
            const Text(
              'How Projects Should Work',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 2),
            Text(
              'My concern is the first two pictures and the last picture in the famous cartoon:',
              style: _textStyle,
            ),
            Hyperlink(_treeSwing, 'https://archive.is/FgxPK'),
            InkWell(
              onTap: () => PopupPage.window<void>(
                context,
                (_) => Center(
                  child: Image.asset(
                    _threeTreesImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              child: Image.asset(
                _threeTreesImage,
                height: _screenSize.height * 0.4,
                width: _screenSize.width * (_smallScreen ? 1 : 0.25),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Simply put, 'garbage in; garbage out.' We have to clarify the requirements right from the start.",
              style: _textStyle,
            ),
            Text(
              "The ‘5 Whys’ exercise is a good start. Conceived years ago by the Toyota Motor Corporation, it came about to help find the root cause to a problem. You simply ask ‘why?’ repeatedly to every answer to the previous question. The trick is to first establish the question that describes the basic overall problem you wish to address.\n\nNote, it doesn't always have to be 5 why’s. It’ll likely be more but, at times, even less. Also, there is the common trap of seemingly identifying the root cause when further why’s would have revealed it’s really not. Finally, make it a point to have other team members try it separately--different people using ‘5 Whys‘ may come up with different answers for the same problem. You will have to consolidate them with yours and try again.",
              style: _textStyle,
            ),
            InkWell(
              onTap: () => PopupPage.window<void>(
                context,
                (_) => Center(
                  child: Image.asset(
                    _fiveWhysImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              child: Image.asset(
                _fiveWhysImage,
                height: _screenSize.height * (_smallScreen ? 0.4 : 0.55),
                width: _screenSize.width * (_smallScreen ? 1 : 0.65),
                fit: BoxFit.fill,
//              alignment: Alignment.centerLeft,
              ),
            ),
            Text(
              "Writing some 'Use Case Scenarios' will then pin down how a possible solution would work:",
              style: _textStyle,
            ),
            if (showLink)
              TextButton(
                onPressed: () {
                  AppRouterDelegate.nextRoute('/use_case');
                },
                child: Text(
                  'Use Case Scenarios',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: fontSize ?? 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//ignore: avoid_classes_with_only_static_members
class _Content {
  static bool visible = false;
}
