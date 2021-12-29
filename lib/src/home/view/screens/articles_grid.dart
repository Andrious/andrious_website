// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ArticlesGrid extends WebPageWidget {
  ArticlesGrid({Key? key})
      : super(controller: ArticlesCarouselController(), key: key);

  @override
  String get title => 'My Technical Articles';
}

class ArticlesLink extends WebPageContainer {
  const ArticlesLink({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'My Technical Article',
        style: TextStyle(fontSize: 24),
      ),
      const Divider(),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: textStyle,
              text:
                  'A grid displays some 66 technical articles I wrote on Flutter and published on ',
            ),
            TextSpan(
              style: textStyle!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              text: 'Medium.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => AppRouterDelegate.nextRoute('/articles'),
            )
          ],
        ),
      ),
    ]);
  }
}
