// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HowProjectsWork extends WebPage {
  const HowProjectsWork({Key? key}) : super(key: key);

  @override
  // Screen's title
  String get title => 'How Projects Really Work';

  @override
  List<Widget> children05(BuildContext context) {
    final _screenSize = screenSize;
    return [
      Stack(
        children: [
          Center(
            child: SizedBox(
              height: _screenSize!.height * 0.99,
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(300, 50, 300, 150),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
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
                  Row(children: const [
                    Text(
                      'My concern is the first two pictures and the last picture in this famous ',
                      style: TextStyle(fontSize: 14),
//                      textAlign: TextAlign.justify,
                    ),
                    Hyperlink(
                        Text('Tree Swing', style: TextStyle(fontSize: 14)),
                        'https://archive.is/FgxPK'),
                    Text(
                      ' cartoon.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                  const Text(
                    "Simply put, 'garbage in; garbage out.' We have to clarify the requirements right from the start.",
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(children: [
                    Image.asset(
                      'assets/images/three_trees.jpg',
                      height: _screenSize.height * 0.3,
                      width: _screenSize.width * 0.25,
                      fit: BoxFit.fill,
                      alignment: Alignment.centerLeft,
                    ),
                    const Expanded(
                      child: Text(
                        'The ‘5 Whys’ exercise is a good start. Conceived years ago by the Toyota Motor Corporation, it came about to help find the root cause to a problem. You simply ask ‘why?’ repeatedly to every answer to the previous question. The trick is to first establish the question that describes the basic overall problem you wish to address. Note, it doesn’t always have to be 5 why’s. It’ll likely be more but, at times, even less.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ]),
                  const Text(
                    'Also, there is the common trap of seemingly identifying the root cause when further why’s would have revealed it’s really not. Finally, make it a point to have other team members try it separately--different people using ‘5 Whys‘ may come up with different answers for the same problem. You will have to consolidate them with yours and try again.',
                    style: TextStyle(fontSize: 14),
                  ),
                  Image.asset(
                    'assets/images/five_whys.jpg',
                    height: _screenSize.height * 0.4,
                    width: _screenSize.width * 0.45,
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                  ),
                  Row(children: [
                    const Text(
                      'Writing some ',
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        AppRouterDelegate.nextRoute('/use_case');
                      },
                      child: const Text(
                        'Use Case Scenarios',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        ' will then pin down how a possible solution would work.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }
}

//ignore: avoid_classes_with_only_static_members
class _Content {
  static bool visible = false;
}
