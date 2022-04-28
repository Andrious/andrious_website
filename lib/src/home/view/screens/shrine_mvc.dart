// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart' hide MyApp;

//ignore: implementation_imports
import 'package:shrine_mvc/main.dart';

class Shrine extends WebPageWidget {
  //
  Shrine({
    GlobalKey? key,
    bool hasBottomBar = true,
  }) : super(
          key: key ?? LabeledGlobalKey('Shrine'),
          title: 'The Shrine Example App',
          controller: _ShrineController(),
          hasBottomBar: hasBottomBar,
        );
}

class _ShrineController extends WebPageController with DevicePreviewMixin {
  Shrine? parentWidget;
  MyApp? app;

  @override
  Widget? builder(BuildContext context) {
    //
    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

    final _landscape = inLandscape;

    final _darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    parentWidget = widget as Shrine;

    final GlobalKey _rowKey = GlobalKey(debugLabel: 'appStores');

    return SizedBox(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(children: [
        Flexible(
          flex: 4,
          child: DevicePreview(
// Supply a key to mount the app and work properly
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
//            storage: DevicePreviewStorage.none(),
//               storage: DevicePreviewStore(
//                 defaultDevice: Devices.ios.iPhone13,),
          ),
        ),
        Row(key: _rowKey, children: [
          googlePlay(
            appId: 'com.andrioussolutions.shrine_mvc',
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
