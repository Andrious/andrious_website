// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  static bool isSmallScreen(BuildContext context) =>
      App.asSmallScreen || MediaQuery.of(context).size.width < 800;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width <= 1200;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return largeScreen;
          } else if (constraints.maxWidth <= 1200 &&
              constraints.maxWidth >= 800) {
            return mediumScreen ?? largeScreen;
          } else {
            return smallScreen ?? largeScreen;
          }
        },
      );
}
