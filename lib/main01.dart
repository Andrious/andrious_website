// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

void main() => runApp(MyApp());

class MyApp extends AppStatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  AppState createView() => AndriousWebsite();
}

class AndriousWebsite extends AppState {
  AndriousWebsite({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
//          debugPaintSizeEnabled: true,
//          debugPaintPointersEnabled: true,
//          debugPaintLayerBordersEnabled: true,
          home: const MainPage(),
        );

  @override
  ThemeData onTheme() {
    //
    final TextTheme textTheme = TextTheme(
      headline1: GoogleFonts.ubuntu(
          fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.ubuntu(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.ubuntu(
          fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.ubuntu(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.ubuntu(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.ubuntu(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.cabin(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.cabin(
          fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.cabin(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.cabin(
          fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.cabin(
          fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );

    const ColorScheme colorScheme = ColorScheme(
      primary: Color(0xFFFFFFFF),
      primaryVariant: Color(0xffB5BFD3),
      secondary: Color(0xffbb86fc),
      secondaryVariant: Color(0xffbb86fc),
      surface: Colors.black,
      background: Color(0xFFFFFFFF),
      error: Colors.red,
      onBackground: Colors.black,
      onError: Colors.red,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      brightness: Brightness.light,
    );

    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.secondary,
      errorColor: colorScheme.error,
      fontFamily: 'Cabin',
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      accentTextTheme: textTheme,
      colorScheme: colorScheme,
      backgroundColor: colorScheme.background,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: colorScheme.secondary,
        ),
      ),
    );
  }
}
