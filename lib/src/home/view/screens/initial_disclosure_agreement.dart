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
    //
    final _screenSize = MyApp.screenSize;

    final _smallScreen = MyApp.inSmallScreen;

    // Sometimes this method is called before the widget is mounted.
    if (_widget == null && widget != null && widget is InitialDisclosure) {
      _widget = widget;
    }

    // Image of the disclosure
    final _disclosure = Image.asset(
      'assets/images/disclosure.png',
      fit: BoxFit.cover,
    );

    Widget child;

    // Supply interaction on the mobile phone.
    if (_smallScreen) {
      child = InteractiveViewer(
        maxScale: 3,
        minScale: 1,
        child: _disclosure,
      );
    } else {
      child = _disclosure;
    }
    const text =
        "We'll sign a Non-Disclosure agreement so you can share your idea with me.";
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
      Text(
        'Got an Idea for an App?',
        style: TextStyle(fontSize: _smallScreen ? 24 : 48),
      ),
      if (_smallScreen) const AutoSizeText(text) else const Text(text),
      InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => PopupPage.window<void>(
          context,
          (_) => Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(200, 100, 200, 50),
              child: child,
            ),
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.fromLTRB(300, 200, 300, 10),
        //   child: _disclosure,
        // ),
        child: Container(
          margin: EdgeInsets.fromLTRB(
            _screenSize.width * (_smallScreen ? 0 : 0.2),
            _screenSize.height * (_smallScreen ? 0.1 : 0.1),
            _screenSize.width * (_smallScreen ? 0.0 : 0.2),
            _screenSize.height * (_smallScreen ? 0.1 : 0.05),
          ),
          child: _disclosure,
        ),
      ),
      // if (!_smallScreen)
      //   Iframe(
      //     height: '1000',
      //     width: '640',
      //     src:
      //         'https://docs.google.com/document/d/e/2PACX-1vSUGrouFhcTcJqJ4ItmKU0qY6XyF4DIPf619wrlEOgvj-kubE9gV3ME_8K-o04vZqHm4nVEUQcSHVSc/pub?embedded=true',
      //   ),
      const Hyperlink(Text('Print'),
          'https://docs.google.com/document/d/1Z2zdFIv_n1HXT2rkU8n6kAOr144b6nHsGbhkUOO9IA0/edit?usp=sharing')
    ];
  }
}
