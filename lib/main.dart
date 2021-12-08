// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Has a conditional import for runApp()
import 'package:andrious/src/view.dart';

void main() => runApp(EasyDynamicThemeWidget(child: MyApp()));

class MyApp extends AppMVC with WebPageFeaturesMixin {
  factory MyApp({Key? key}) => _this ??= MyApp._(key);
  MyApp._(Key? key) : super(key: key, errorReport: _onErrorReport);
  static MyApp? _this;

  @override
  AppState createState() => _MyAppState();

  /// Log the error
  static Future<void> _onErrorReport(
    dynamic exception,
    StackTrace stack,
  ) async {
    //
    if (App.inDebugger) {
      //
      final report = _ReportError();
      report.display(exception, stack);
    }
  }

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
    //
    bool smallScreen;
    //
    final Size? screenSize = sizeScreen(context: context, size: size);

    // May be manually assigned.
    smallScreen = asSmallScreen;

    if (!smallScreen && screenSize != null) {
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
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            I10nDelegate(),
          ],
          supportedLocales: I10n.supportedLocales,
          routerDelegate: AppRouterDelegate(routes: {
            '/': (_) => HomePageSmall(),
            '/projects_work': (_) => HowProjectsWork(),
            '/five_whys': (_) => FiveWhys(),
            '/paradox': (_) => ProgrammingParadox(),
            '/use_case': (_) => UseCaseExample(),
            '/disclosure': (_) => InitialDisclosure(),
            '/articles': (_) => ArticlesGrid(),
            '/packages': (_) => interactiveViewer(DartPackages()),
            '/privacy': (_) => PrivacyPolicy(),
            '/interfaces': (_) => FlutterUIs(),
          }),
          routeInformationParser: AppRouteInformationParser(),
        );
  TextStyle? bodyText2;

  @override
  ThemeData? onDarkTheme() => darkThemeData.copyWith(
        textTheme: customTheme.textTheme.merge(
          TextTheme(
            bodyText2: TextStyle(
              fontSize: customTheme.textTheme.bodyText2!.fontSize! +
                  AppTheme.fontIncrement,
            ),
          ),
        ),
      );

  @override
  ThemeMode onThemeMode() => AppTheme.mode();

  @override
  ThemeData onTheme() {
    // Record the original text style
    bodyText2 ??= customTheme.textTheme.bodyText2!;

    // return lightThemeData.copyWith(
    //   textTheme: customTheme.textTheme.merge(
    //     TextTheme(
    //       bodyText2: TextStyle(
    //         fontSize: firstSize! + AppTheme.fontIncrement,
    //       ),
    //     ),
    //   ),
    // );
    return lightThemeData.copyWith(
      textTheme: customTheme.textTheme.copyWith(
        bodyText2: bodyText2!.copyWith(
          fontSize: bodyText2!.fontSize! + AppTheme.fontIncrement,
        ),
      ),
    );
  }

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
  //
  static Map<double, String> dropItems = {};

  static final Map<String, double> fontIncs = {
    '0': 0,
    '+1': 1,
    '+2': 2,
    '+3': 3
  };

  static double get fontIncrement => Prefs.getDouble('fontSizeInc');

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

  /// The 'Dark Mode' button
  static Widget get darkModeButton => const IconButton(
        icon: Icon(Icons.brightness_6),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: AppTheme.toggleMode,
      );

  /// Assign the 'dark mode' or not.
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

  static Widget get fontSizeButton {
    //
    final double fontInc = fontIncrement;

    if (dropItems.isEmpty) {
      /// Populate the dropdown items.
      fontIncs.forEach((key, value) {
        dropItems[value] = key;
      });
    }

    final value = dropItems[fontInc];

    final items = fontIncs.keys;

    return DropdownButton<String>(
      value: value,
      hint: const Text('Select a font size'),
      icon: const Icon(Icons.text_fields),
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
      onChanged: (String? v) {
        final inc = fontIncs[v]!;
        Prefs.setDouble('fontSizeInc', inc);
        App.refresh();
      },
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}

final customTheme = ThemeData(
// // Define the default brightness and colors.
//   brightness: Brightness.dark,
//   primaryColor: Colors.lightBlue[800],
//   accentColor: Colors.cyan[600],

// Define the default font family.
  fontFamily: 'Montserrat',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72),
    headline6: TextStyle(fontSize: 36),
    bodyText2: TextStyle(fontSize: 18, height: 2, fontWeight: FontWeight.bold),
  ),
);

class _ReportError {
  //
  List<String> message(dynamic exception, StackTrace stack) {
    //
    final List<String> msg = [];

    msg.add('ERROR: $exception\n\n');

    final stackTrace = stack.toString().split('\n');

    int length = stackTrace.length;

    if (length > 0) {
      //
      length = length > 10 ? 10 : length;

      msg.add('\n\n');

      msg.addAll(stackTrace.sublist(0, length));
    }
    return msg;
  }

  void display(dynamic exception, StackTrace stack) {
    //
    final text = message(exception, stack);

    if (text.isEmpty) {
      return;
    }

    final screenSize = MyApp.screenSize;

    showBox(
      context: StateSet.lastContext!,
      contentPadding: const EdgeInsets.all(10),
      scrollable: true,
      content: Center(
        child: Container(
          height: screenSize.height * 0.75,
          width: screenSize.width * 0.9,
          child: ListView.builder(
            itemCount: text.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(text[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  bool log(dynamic exception, StackTrace stack) {
    //
    final web = WebUtils();

    final text = message(exception, stack);

    return web.saveTextFile(text, 'errorLog');
  }
}
