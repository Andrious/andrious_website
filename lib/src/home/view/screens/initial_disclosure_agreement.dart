// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class InitialDisclosure extends WebPage<InitialDisclosure> {
  InitialDisclosure({Key? key, this.banner = true}) : super(key: key);
  final bool banner;

  @override
  // Screen's title
  String get title => 'Initial Disclosure Agreement';

  @override
  List<Widget> children05(BuildContext context) {
    final _screenSize = screenSize;
    final _smallScreen = MyApp.inSmallScreen;
    return [
      if (banner)
        SizedBox(
          height: _screenSize!.height * 0.45,
          width: _screenSize.width,
          child: Image.asset(
            'assets/images/earthNetworked.jpg',
            fit: BoxFit.cover,
          ),
        ),
      if (_smallScreen)
        InteractiveViewer(
          maxScale: 3,
          minScale: 1,
          child: Image.asset(
            'assets/images/disclosure.png',
            fit: BoxFit.cover,
          ),
        ),
      if (!_smallScreen)
        Iframe(
          height: '1000',
          width: '640',
          src:
              'https://docs.google.com/document/d/e/2PACX-1vSUGrouFhcTcJqJ4ItmKU0qY6XyF4DIPf619wrlEOgvj-kubE9gV3ME_8K-o04vZqHm4nVEUQcSHVSc/pub?embedded=true',
        ),
      const Hyperlink(Text('Print'),
          'https://docs.google.com/document/d/1Z2zdFIv_n1HXT2rkU8n6kAOr144b6nHsGbhkUOO9IA0/edit?usp=sharing')
//      DestinationHeading(screenSize: _screenSize),
    ];
  }
}
