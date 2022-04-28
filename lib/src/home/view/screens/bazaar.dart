// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart' hide MyApp;

//ignore: implementation_imports
import 'package:bazaar/main.dart';

class Bazaar extends WebPageWidget {
  //
  Bazaar({
    GlobalKey? key,
    bool hasBottomBar = true,
  }) : super(
          key: key ?? LabeledGlobalKey('Bazaar'),
          title: 'The Bazaar Example App',
          controller: _BazaarController(),
          hasBottomBar: hasBottomBar,
        );
}

class _BazaarController extends WebPageController with DevicePreviewMixin {
  Bazaar? parentWidget;
  MyApp? app;

  @override
  Widget? builder(BuildContext context) {
    //
    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

    final _landscape = inLandscape;

    final _darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    parentWidget = widget as Bazaar;

    // Allows the app to be moved around and not disposed the widget tree
    final _previewKey = GlobalKey(debugLabel: 'DevicePreview');

    final _rowKey = GlobalKey(debugLabel: 'appstores');

//    final _appKey = GlobalKey(debugLabel: 'bizaar');

    return SizedBox(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(children: [
        Flexible(
          flex: 4,
          child: DevicePreview(
            key: _previewKey,
            builder: (context) => MyApp(),
            enabled: kIsWeb,
            tools: [
              description,
//        ...DevicePreview.defaultTools,
              const DeviceSection(
                orientation: false,
                frameVisibility: false,
                virtualKeyboard: false,
              ),
              const SettingsSection(),
            ],
//        devices: mobiles,
            storage: DevicePreviewStorage.none(),
          ),
        ),
        Row(key: _rowKey, children: [
          googlePlay(
            appId: 'com.andrioussolutions.bazaar_demo',
            darkMode: _darkMode,
          ),
          appStore(
//            appId: 'com.andrioussolutions.bazaar_demo',
            darkMode: _darkMode,
          ),
          windowsStore(
            appId: '9NCVMK8PLKSP',
            darkMode: _darkMode,
          ),
        ]),
      ]),
    );
  }

  // List<DeviceInfo> get mobiles => [
  //       ...Devices.ios.all,
  //       ...Devices.android.all,
  //     ];

  Widget get description => const ToolPanelSection(
        title: '',
        children: [
          Text("     Here's another working app. Imagine all "),
          Text('     the capabilities you want in your app'),
          Text('     running on any device you want adjusting'),
          Text("     its 'look and feel' accordingly."),
          Text(' '),
          Text('     You can take advantage of the platform used'),
          Text('     and yet have all the code in one place and'),
          Text('     in one language. Makes for a maintainable app.'),
        ],
      );
}
