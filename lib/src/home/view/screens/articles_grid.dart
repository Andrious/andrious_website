// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ArticlesGrid extends WebPage {
  ArticlesGrid({Key? key}) : super(ArticlesController(), key: key);

  @override
  String get title => 'My Technical Articles';
}

class ArticleImage extends StatelessWidget with WebPageFeaturesMixin {
  const ArticleImage(
    this.con, {
    required this.index,
    required this.constraints,
    Key? key,
  }) : super(key: key);
  final ArticlesController con;
  final int index;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => PopupPage.window<void>(context, browser),
        child: Image.asset(
          con.articles[index],
          fit: BoxFit.contain,
        ),
      );

  Widget browser(BuildContext context) => Center(
        child: Material(
          child: InkWell(
            onTap: () async {
              await con.browse(
                context: context,
                index: index,
                webPage: this,
              );
            },
            child: Image.asset(
              con.articles[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
