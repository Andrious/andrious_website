// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/controller.dart';

// Has a conditional import for runApp()
import 'package:andrious/src/view.dart';

void main() => runApp(EasyDynamicThemeWidget(child: MyApp()));

class MyApp extends AppStatefulWidget with WebPageFeaturesMixin {
  factory MyApp({Key? key}) => _this ??= MyApp._(key);
  MyApp._(Key? key) : super(key: key);
  static MyApp? _this;

  @override
  AppState createView() => _MyAppState();

  /// Is the phone orientated in Portrait
  static bool get inPortrait => _orientation == Orientation.portrait;

  /// Is the phone orientated in Landscape
  static bool get inLandscape => _orientation == Orientation.landscape;

  /// Determine the phone's orientation
  static Orientation orientation(BuildContext context) =>
      _orientation = MediaQuery.of(context).orientation;
  static Orientation? _orientation;

  /// Return the screen size the app is running on.
  static Size get screenSize => _screenSize!;
  static Size? _screenSize;

  /// Set whether the app is to use a 'small screen' or not.
  /// Determine if running on a desktop or on a phone or tablet
  static bool get asSmallScreen => App.inDebugger && false;

  /// Return the bool value indicating if running in a small screen or not.
  static bool get inSmallScreen => _inSmallScreen;
  static bool _inSmallScreen = false;

  /// Determine if the app is running on a 'small screen' or not.
  static bool isSmallScreen({BuildContext? context, Size? size}) {
    bool smallScreen = asSmallScreen;
    final Size? screenSize = sizeScreen(context: context, size: size);
    if (screenSize != null) {
      smallScreen = screenSize.width < 800;
    }
    _inSmallScreen = smallScreen;
    return smallScreen;
  }

  static Size? sizeScreen({BuildContext? context, Size? size}) {
    Size? screenSize;
    if (context != null) {
      screenSize = MediaQuery.of(context).size;
    } else if (size != null) {
      screenSize = size;
    }
    _screenSize = screenSize;
    return screenSize;
  }

  /// Supply a ready-means to browse the Internet.
  static Future<bool> browseUri(String? uri) async {
    bool browse;
    if (uri == null) {
      browse = false;
    } else {
      browse = await _this!.uriBrowse(uri);
    }
    return browse;
  }
}

class _MyAppState extends AppState {
  _MyAppState()
      : super(
          useMaterial: true,
          debugShowCheckedModeBanner: false,
          title: 'Andrious Solutions',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            I10nDelegate(),
          ],
          supportedLocales: I10n.supportedLocales,
          routerDelegate: AppRouterDelegate(routes: {
            '/': (BuildContext context) => HomePageSmall(),
//                MyApp.useSmallScreen ? HomePageSmall() : HomePage(),
            // '/': (BuildContext context) =>
            //     MyApp.useSmallScreen ? HomeScreen() : HomePage(),
//            '/': (BuildContext context) => HomePage(),
            '/projects_work': (BuildContext context) => HowProjectsWork(),
            '/paradox': (BuildContext context) => ProgrammingParadox(),
            '/use_case': (context) => UseCaseExample(),
            '/disclosure': (context) => InitialDisclosure(),
            '/articles': (context) => ArticlesGrid(),
          }),
          routeInformationParser: AppRouteInformationParser(),
        );

  @override
  ThemeMode onThemeMode() => AppTheme.mode();

  //
  // Future<void> getUserInfo() async {
  //   await getUser();
  //   setState(() {});
  //   print(uid);
  // }
  //
  // @override
  // void initState() {
  //   getUserInfo();
  //   super.initState();
  // }
}

//ignore: avoid_classes_with_only_static_members
class AppTheme {
  /// Set the app's theme mode.
  static ThemeMode mode([String? themeMode]) {
//
    String? setting = '';

    if (themeMode != null && themeMode.isNotEmpty) {
      themeMode = themeMode.toLowerCase().trim();
      if ('light dark system'.contains(themeMode)) {
        setting = themeMode;
        Prefs.setString('ThemeMode', setting);
      }
    }

    if (setting.isEmpty) {
      setting = Prefs.getString('ThemeMode', 'system');
    }

    ThemeMode mode;
    switch (setting) {
      case 'light':
        mode = ThemeMode.light;
        break;
      case 'dark':
        mode = ThemeMode.dark;
        break;
      default:
        mode = ThemeMode.system;
    }
    return mode;
  }

  static ThemeMode toggleMode() {
    //
    var setting = Prefs.getString('ThemeMode', 'system');

    if (setting == 'system') {
      setting = 'dark';
    } else {
      setting = 'system';
    }
    App.refresh();
    return mode(setting);
  }
}
