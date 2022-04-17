// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class CompanyHistory extends WebPageWidget {
  CompanyHistory({
    GlobalKey? key,
    this.readMore = false,
  }) : super(
          title: 'Company History',
          key: key ?? LabeledGlobalKey('CompanyHistory'),
          controller: _CompanyHistoryController(),
        );
  final bool? readMore;
}

class _CompanyHistoryController extends WebPageController {
  factory _CompanyHistoryController() =>
      _this ??= _CompanyHistoryController._();
  _CompanyHistoryController._() : super();
  static _CompanyHistoryController? _this;

  late CompanyHistory parentWidget;

  @override
  Widget builder(BuildContext context) {
    //
    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

    parentWidget = widget as CompanyHistory;

    final textStyle = Theme.of(context).textTheme.bodyText2;

    const String text =
        "Flutter officially launched on Dec. 4th, 2018. I began working in Flutter nine months earlier.\nWorked 17 years in a sea of cubicles, I now have my own company, Andrious Solutions Ltd.  (corporation# 9363076). I soon became a prominent contributor to the Flutter community having written a number of technical articles and released some 12 libraries called packages for Flutter developers. I'm back in my hometown of Winnipeg to start my business.";
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: TextStyle(fontSize: _smallScreen ? 24 : 48),
            ),
            SizedBox(height: _screenSize.height * 0.05),
            // If not set to the 'read more' feature
            if (!parentWidget.readMore!)
              AutoSizeText(
                text,
                style: textStyle,
              ),
            // If no 'widget' or set to 'read more' feature.
            if (parentWidget.readMore!)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textStyle,
                      text: text.substring(0, 560),
                    ),
                    TextSpan(
                      style: textStyle!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      text: ' ...read more',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppRouterDelegate.nextRoute('/company');
                        },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
