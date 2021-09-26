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
            child: SingleChildScrollView(
              primary: false,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: con.articles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ResponsiveWidget.isSmallScreen(context) ? 3 : 5,
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
        onTap: () async {
          await Navigator.of(context).push<void>(
            _popupWindow(
              context,
              con: con,
              index: index,
            ),
          );
        },
        child: Image.asset(
          con.articles[index],
          fit: BoxFit.contain,
        ),
      );

  /// Create a popup window
  Route<void> _popupWindow(
    BuildContext parentContext, {
    required ArticlesController con,
    required int index,
  }) =>
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) => _PopupPage(
          con: con,
          index: index,
          webPage: this,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final rectAnimation = _createTween(parentContext)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation);
          return Stack(
            children: [
              PositionedTransition(rect: rectAnimation, child: child),
            ],
          );
        },
      );

  /// Define the transition used in the animation
  Tween<RelativeRect> _createTween(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    final box = context.findRenderObject() as RenderBox;
    final rect = box.localToGlobal(Offset.zero) & box.size;
    final relativeRect = RelativeRect.fromSize(rect, windowSize);
    return RelativeRectTween(
      begin: relativeRect,
      end: RelativeRect.fill,
    );
  }
}

class _PopupPage extends WebPage<_PopupPage> {
  _PopupPage({
    required this.con,
    required this.index,
    required this.webPage,
  });
  final ArticlesController con;
  final int index;
  final WebPageFeaturesMixin webPage;

  @override
  String get title => '';

  @override
  Widget child(BuildContext context) => Center(
        child: Material(
          child: InkWell(
            onTap: () async {
              await con.browse(
                context: context,
                index: index,
                webPage: webPage,
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
