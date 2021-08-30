// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class InitialDisclosure extends WebPage {
  const InitialDisclosure({Key? key}) : super(key: key);

  @override
  // Screen's title
  String get title => 'Initial Disclosure Agreement';

  @override
  List<Widget> children(BuildContext context) {
    final _screenSize = screenSize;
    return [
      Stack(
        children: [
          SizedBox(
            height: _screenSize!.height * 0.45,
            width: _screenSize.width,
            child: Image.asset(
              'assets/images/earhNetworked.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              FloatingQuickAccessBar(screenSize: _screenSize),
              Iframe(
                height: '1000',
                width: '640',
                src:
                    'https://docs.google.com/document/d/e/2PACX-1vSUGrouFhcTcJqJ4ItmKU0qY6XyF4DIPf619wrlEOgvj-kubE9gV3ME_8K-o04vZqHm4nVEUQcSHVSc/pub?embedded=true',
              ),
              const Hyperlink(Text('Print'),
                  'https://docs.google.com/document/d/1Z2zdFIv_n1HXT2rkU8n6kAOr144b6nHsGbhkUOO9IA0/edit?usp=sharing'),
            ],
          )
        ],
      ),
//      DestinationHeading(screenSize: _screenSize),
    ];
  }
}
