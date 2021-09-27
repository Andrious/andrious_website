// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ArticlesGrid extends WebPage<ArticlesGrid> {
  ArticlesGrid({Key? key})
      : con = ArticlesController(),
        super(key: key);
  final ArticlesController con;

  @override
  String get title => 'My Technical Articles';

  @override
  Widget child(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          ),
          child: Material(
            child: GridView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: con.articles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 3 : 5,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) => ArticleImage(
                con,
                index: index,
                constraints: constraints,
              ),
            ),
          ),
        ),
      );
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
