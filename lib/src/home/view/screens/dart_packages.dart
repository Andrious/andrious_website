// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class DartPackages extends StatelessWidget {
  DartPackages({Key? key})
      : con = DartPackagesController(),
        super(key: key);
  final DartPackagesController con;

  ///Scroll to position
  static const double offset = 5600;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          ),
          child: GridView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: con.packages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: App.inSmallScreen ? 2 : 3,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => DartCard(
              image: con.packages[index],
              uri: con.webPages[con.packages[index]]!,
              height: constraints.maxHeight * 0.3,
            ),
          ),
        ),
      );
}

class DartCard extends StatelessWidget {
  // with WebPageFeaturesMixin {
  const DartCard({
    required this.image,
    required this.uri,
    required this.height,
    Key? key,
  }) : super(key: key);
  final String image;
  final String uri;
  final double height;

  @override
  Widget build(BuildContext context) => Material(
        child: InkWell(
          onTap: () {
            uriBrowse(uri);
          },
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      );
}

class DartPackagesController {
  DartPackagesController() {
    //
    _webPages = {
      '$_imagePath/01mvc_pattern.jpg': 'https://pub.dev/packages/mvc_pattern/',
      '$_imagePath/02prefs.jpg': 'https://pub.dev/packages/prefs/',
      '$_imagePath/03auth.jpg': 'https://pub.dev/packages/auth/',
      '$_imagePath/04popup.jpg': 'https://pub.dev/packages/app_popup_menu/',
      '$_imagePath/05ads.jpg': 'https://pub.dev/packages/ads/',
      '$_imagePath/06mvc_application.jpg':
          'https://pub.dev/packages/mvc_application/',
      '$_imagePath/07dbutils.jpg': 'https://pub.dev/packages/dbutils/',
      '$_imagePath/08stateset.jpg': 'https://pub.dev/packages/state_set/',
      '$_imagePath/09translator.jpg':
          'https://pub.dev/packages/i10n_translator/',
      '$_imagePath/10remote.jpg': 'https://pub.dev/packages/remote_config/',
    };
    _packages = _webPages.keys.toList(growable: false);
  }
  final String _imagePath = 'assets/images/packages';

  List<String> get packages => _packages;
  late List<String> _packages;

  Map<String, String> get webPages => _webPages;
  late Map<String, String> _webPages;
}

class PackagesLink extends WebPageContainer {
  const PackagesLink({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Flutter Packages',
        style: TextStyle(fontSize: 24),
      ),
      const Divider(),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: textStyle,
              text:
                  "As an early adapter, I've made my own contributions to the Flutter community with ",
            ),
            TextSpan(
              style: textStyle!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              text: '11 published packages',
              recognizer: TapGestureRecognizer()
                ..onTap = () => AppRouterDelegate.newRoute('/packages'),
            ),
            TextSpan(
              style: textStyle,
              text: ' to date.',
            ),
          ],
        ),
      ),
    ]);
  }
}
