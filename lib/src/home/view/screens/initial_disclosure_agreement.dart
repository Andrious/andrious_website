// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class InitialDisclosure extends WebPage {
  InitialDisclosure({Key? key, this.banner = true})
      : super(_InitialDisclosureController(), key: key);
  final bool banner;

  @override
  // Screen's title
  String get title => 'Initial Disclosure Agreement';
}

class _InitialDisclosureController extends WebPageController {
  @override
  void initState() {
    super.initState();
    _widget = widget as InitialDisclosure;
  }

  InitialDisclosure? _widget;

  @override
  List<Widget> children05(BuildContext context, [WebPage? widget]) {
    final _screenSize = MyApp.screenSize;
    final _smallScreen = MyApp.inSmallScreen;
    // Sometimes this method is called before the widget is mounted.
    if (_widget == null && widget != null && widget is InitialDisclosure) {
      _widget = widget;
    }
    final _disclosure = Image.asset(
      'assets/images/disclosure.png',
      fit: BoxFit.cover,
    );
    return [
      if (_widget?.banner ?? true)
        SizedBox(
          height: _screenSize.height * 0.45,
          width: _screenSize.width,
          child: Image.asset(
            'assets/images/earthNetworked.jpg',
            fit: BoxFit.cover,
          ),
        ),
      if (_smallScreen)
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () => PopupPage.window<void>(
            context,
            (_) => Center(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: InteractiveViewer(
                  maxScale: 3,
                  minScale: 1,
                  child: _disclosure,
                ),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: _disclosure,
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
