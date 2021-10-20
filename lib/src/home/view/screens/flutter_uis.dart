// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class FlutterUIs extends WebPage {
  factory FlutterUIs({Key? key}) => _this ??= FlutterUIs._(key);
  FlutterUIs._(Key? key)
      : super(
          FlutterUIsController(
            primary: false,
            physics: const AlwaysScrollableScrollPhysics(),
          ),
          key: key,
          title: 'Flutter UI Examples',
          coverBanner: false,
          accessBar: false,
          bottomBar: false,
        );
  static FlutterUIs? _this;

  Widget coverPage(BuildContext context, {void Function()? onTap}) =>
      FlutterUIsController().coverPage(context, onTap: onTap);
}

class FlutterUIsController extends WebPageController {
  factory FlutterUIsController({
    bool? primary,
    ScrollPhysics? physics,
  }) =>
      _this ??= FlutterUIsController._(primary, physics);

  FlutterUIsController._(
    bool? primary,
    ScrollPhysics? physics,
  ) : super(
          primary: primary,
          physics: physics,
        );
  static FlutterUIsController? _this;

  final String uiExamples = 'assets/images/flutteruis/flutter_ui_examples.png';

  /// Display the cover page
  Widget coverPage(BuildContext context, {void Function()? onTap}) {
    final _screenSize = MyApp.screenSize;

    final _smallScreen = MyApp.inSmallScreen;

    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Container(
      margin: EdgeInsets.fromLTRB(
        _screenSize.width * (_smallScreen ? 0 : 0.2),
        _screenSize.height * (_smallScreen ? 0.1 : 0.2),
        _screenSize.width * (_smallScreen ? 0.0 : 0.2),
        _screenSize.height * (_smallScreen ? 0.1 : 0.2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(_smallScreen ? 10 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Interface Examples',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 18),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                style: textStyle,
                text: 'The ',
              ),
              TextSpan(
                style: textStyle!.copyWith(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
                text: 'Flutter Challenge',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const url =
                        'https://lohanidamodar.github.io/flutter_ui_challenges/#/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
              ),
              TextSpan(
                style: textStyle,
                text:
                    " was originally posted by three developers to merely demonstrate Flutter's user interface capabilities. However, it's proven to be a very useful tool when developing applications for customers. It is essentially a catalogue of demonstration screens and showcases an array of functions and features available to the customer.\n\nI've made a point to introduce this catalogue for customers to browse through. They can then literally pick out the 'look and feel' they wish to attain for their own app.",
              ),
            ]),
          ),
          // const AutoSizeText(
          //   "The Flutter Challenge was originally posted by three developers to merely demonstrate Flutter's user interface capabilities. However, it's proven to be a very useful tool when developing applications for customers. It is essentially a catalogue of demonstration screens and showcases an array of functions and features available to the customer.\n\nI've made a point to introduce this catalogue for customers to browse through. They can then literally pick out the 'look and feel' they wish to attain for their own app.",
          // ),
          SizedBox(height: _screenSize.height * 0.05),
          if (!_smallScreen)
            InkWell(
              onTap: onTap ??
                  () {
                    AppRouterDelegate.nextRoute('/interfaces');
                  },
              child: Image.asset(
                uiExamples,
                height: _screenSize.height * (_smallScreen ? 0.8 : 0.8),
                width: _screenSize.width * (_smallScreen ? 1 : 0.55),
                fit: BoxFit.fill,
              ),
            )
        ],
      ),
    );
  }

  @override
  List<Widget>? withHeader04(BuildContext context, [WebPage? widget]) => [
        flutterUI(context),
        flutterUIInstall(context),
        flutterUChrome(context),
        flutterUIDesktop(context),
      ];

  Widget flutterUI(BuildContext context) => popupScreen(
        context,
        title: 'Flutter User Interface Challenge',
        text: '',
        interactive: false,
        name: 'assets/images/flutteruis/flutter_ui.png',
      );

  Widget flutterUIInstall(BuildContext context) => popupScreen(
        context,
        title: 'Flutter User Interface Challenge',
        text: '',
        interactive: false,
        name: 'assets/images/flutteruis/flutter_ui_install.png',
      );

  Widget flutterUChrome(BuildContext context) => popupScreen(
        context,
        title: 'On Chrome',
        text: '',
        interactive: false,
        name: 'assets/images/flutteruis/flutter_ui_chrome.png',
      );

  Widget flutterUIDesktop(BuildContext context) => popupScreen(
        context,
        title: 'On Your Desktop',
        text: '',
        interactive: false,
        name: 'assets/images/flutteruis/flutter_ui_desktop.png',
      );
}
