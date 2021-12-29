// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class InitialDisclosure extends WebPageWidget {
  InitialDisclosure({Key? key, this.banner = true})
      : super(controller: _InitialDisclosureController(), key: key);
  final bool banner;

  @override
  // Screen's title
  String get title => 'Initial Disclosure Agreement';
}

class _InitialDisclosureController extends WebPageController {
  @override
  Widget builder(BuildContext context) {
    //
    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

    final _widget = widget as InitialDisclosure;

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

    const text = "We'll sign a Non-Disclosure agreement so you can tell me.";

    const printLink = Hyperlink(Text('Print'),
        'https://docs.google.com/document/d/1Z2zdFIv_n1HXT2rkU8n6kAOr144b6nHsGbhkUOO9IA0/edit?usp=sharing');

    return Column(children: [
      if (_widget.banner)
        SizedBox(
          height: _screenSize.height * 0.45,
          width: _screenSize.width,
          child: Image.asset(
            'assets/images/earthNetworked.jpg',
            fit: BoxFit.cover,
          ),
        ),
      InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => PopupPage.window<void>(
          context,
          (_) => Center(
            child: Container(
                margin: EdgeInsets.fromLTRB(
                  _screenSize.width * 0.1,
                  _screenSize.height * 0.1,
                  _screenSize.width * 0.1,
                  _screenSize.height * 0.1,
                ),
                child: Column(children: [child, printLink])),
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(
            _screenSize.width * (_smallScreen ? 0.01 : 0.2),
            _screenSize.height * (_smallScreen ? 0.01 : 0.1),
            _screenSize.width * (_smallScreen ? 0.01 : 0.2),
            _screenSize.height * (_smallScreen ? 0.01 : 0.05),
          ),
          child: Column(children: [
            if (_smallScreen)
              const AutoSizeText(
                'Got an Idea for an App?',
                style: TextStyle(fontSize: 24),
              )
            else
              const Text(
                'Got an Idea for an App?',
                style: TextStyle(fontSize: 48),
              ),
            SizedBox(
              height: _screenSize.height * 0.01,
            ),
            if (_smallScreen) const AutoSizeText(text) else const Text(text),
            SizedBox(
              height: _screenSize.height * 0.01,
            ),
            _disclosure,
          ]),
        ),
      ),
      printLink,
    ]);
  }
}
