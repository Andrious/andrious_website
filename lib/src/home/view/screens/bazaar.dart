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
        if (!_darkMode)
          Row(key: _rowKey, children: [
            googlePlay('images/logos/googleplay_light.png'),
            appStore('images/logos/appstore_light.png'),
            windowsStore('images/logos/windows_store_light.png'),
          ]),
        if (_darkMode)
          Row(key: _rowKey, children: [
            // Image.asset('images/logos/googleplay_dark.png'),
            // Image.asset('images/logos/appstore_dark.png'),
            googlePlay('images/logos/googleplay_dark.png'),
            appStore('images/logos/appstore_dark.png'),
            windowsStore('images/logos/windows_store_dark.png'),
          ])
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
          Text("     That's a working app running on this site,"),
          Text("     but it'll also run on any mobile or laptop."),
          Text('     One program running anywhere.'),
          Text("     This just wasn't possible for decades!"),
          Text(' '),
          Text("     Switch 'Device preview' to run as a web app."),
          Text('     Select a different device below'),
          Text('     ...and image the possibilities.'),
        ],
      );
}
