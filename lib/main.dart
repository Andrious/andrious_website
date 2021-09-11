// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

void main() => runApp(EasyDynamicThemeWidget(child: MyApp()));

class MyApp extends AppStatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  AppState createView() => _MyAppState();

  /// Set whether the app is to use a 'small screen' or not.
  static bool inSmallScreen = true;

  ///
  static bool get useSmallScreen => App.inDebugger && inSmallScreen;
}

class _MyAppState extends AppState {
  _MyAppState()
      : super(
          useMaterial: true,
          debugShowCheckedModeBanner: false,
          title: 'Andrious Solutions',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          routerDelegate: AppRouterDelegate(routes: {
            '/': (BuildContext context) =>
                MyApp.useSmallScreen ? HomePageSmall() : HomePage(),
            // '/': (BuildContext context) =>
            //     MyApp.useSmallScreen ? HomeScreen() : HomePage(),
//            '/': (BuildContext context) => HomePage(),
            '/projects_work': (BuildContext context) => HowProjectsWork(),
            '/paradox': (BuildContext context) => ProgrammingParadox(),
            '/use_case': (context) => UseCaseExample(),
            '/disclosure': (context) => InitialDisclosure(),
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
