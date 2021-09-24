// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HowProjectsWork extends WebPage<HowProjectsWork> {
  HowProjectsWork({Key? key}) : super(key: key);

  static const double offset = 200;

  @override
  // Screen's title
  String get title => 'How Projects Really Work';

  @override
  List<Widget> children05(BuildContext context) {
//    final smallScreen = ResponsiveWidget.isSmallScreen(context);
    final smallScreen = MyApp.inSmallScreen;
    final _screenSize = MediaQuery.of(context).size;
    return [
      Stack(
        children: [
          Center(
            child: SizedBox(
              height: _screenSize.height * 0.99,
              width: _screenSize.width * 0.99,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _Content.visible = !_Content.visible;
                  });
                },
                child: Image.asset(
                  'assets/images/how_projects_work.jpg',
                ),
              ),
            ),
          ),
          Visibility(
            visible: _Content.visible,
            // Method is below. Allowing to be called separately.
            child: popup(context, fontSize: smallScreen ? 14 : 18),
          ),
        ],
      ),
    ];
  }

  Widget popup(BuildContext context, {double? fontSize}) {
//    final _smallScreen = ResponsiveWidget.isSmallScreen(context);
    final _smallScreen = MyApp.inSmallScreen;
//    final _screenSize = MediaQuery.of(context).size;
    final _screenSize = MyApp.screenSize;
    final _textStyle = TextStyle(fontSize: fontSize ?? 14);
    final _treeSwing = Text('Tree Swing', style: _textStyle);
    return Center(
      child: Container(
//        margin: const EdgeInsets.fromLTRB(200, 50, 200, 150),
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * (_smallScreen ? 0.2 : 0.15),
          _screenSize.height * (_smallScreen ? 0.15 : 0.2),
          _screenSize.width * (_smallScreen ? 0.2 : 0.15),
          _screenSize.height * (_smallScreen ? 0.15 : 0.2),
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
            Row(children: [
              Flexible(
                flex: 2,
                child: Text(
                  'My concern is the first two pictures and the last picture in the famous cartoon:',
                  style: _textStyle,
                ),
              ),
              Flexible(
                child: Hyperlink(_treeSwing, 'https://archive.is/FgxPK'),
              ),
            ]),
            Text(
              "Simply put, 'garbage in; garbage out.' We have to clarify the requirements right from the start.",
              style: _textStyle,
            ),
            Row(children: [
              Image.asset(
                'assets/images/three_trees.jpg',
                height: _screenSize.height * (_smallScreen ? 0.3 : 0.3),
                width: _screenSize.width * (_smallScreen ? 0.3 : 0.25),
                fit: BoxFit.fill,
                alignment: Alignment.centerLeft,
              ),
              Expanded(
                child: Text(
                  'The ‘5 Whys’ exercise is a good start. Conceived years ago by the Toyota Motor Corporation, it came about to help find the root cause to a problem. You simply ask ‘why?’ repeatedly to every answer to the previous question. The trick is to first establish the question that describes the basic overall problem you wish to address. Note, it doesn’t always have to be 5 why’s. It’ll likely be more but, at times, even less.',
                  style: _textStyle,
                ),
              ),
            ]),
            Text(
              'Also, there is the common trap of seemingly identifying the root cause when further why’s would have revealed it’s really not. Finally, make it a point to have other team members try it separately--different people using ‘5 Whys‘ may come up with different answers for the same problem. You will have to consolidate them with yours and try again.',
              style: _textStyle,
            ),
            Image.asset(
              'assets/images/five_whys.png',
              height: _screenSize.height * (_smallScreen ? 0.45 : 0.55),
              width: _screenSize.width * (_smallScreen ? 0.55 : 0.65),
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
            ),
            Row(children: [
              Text(
                'Writing some ',
                style: _textStyle,
              ),
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
              Flexible(
                flex: 2,
                child: Text(
                  ' will then pin down how a possible solution would work.',
                  style: _textStyle,
                ),
              ),
            ]),
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