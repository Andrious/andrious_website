// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HowProjectsWork extends WebPage {
  HowProjectsWork({
    Key? key,
    this.showPopup = true,
    this.readMore = false,
  }) : super(
          key: key ?? LabeledGlobalKey('HowProjectsWork'),
          title: 'How Projects Really Work',
        );
  final bool? showPopup;
//  static const double offset = 200;

  final String _projectsImage = 'assets/images/how_projects_work.jpg';

  // Flag indicating whether 'read more' option is displayed or not.
  final bool? readMore;

  /// Return the widget containing the web page's main content.
  @override
  Widget builder(BuildContext context) {
    // MyApp.inSmallScreen allows this method to be called before the build() function.
    final _smallScreen = context.inSmallScreen;
    return Stack(
      children: [
        Center(
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: !_smallScreen
                ? null
                : () {
                    if (showPopup ?? true) {
                      setState(() {
                        _Content.visible = !_Content.visible;
                      });
                    } else {
                      PopupPage.window<void>(
                        context,
                        (_) {
                          Widget child = Image.asset(
                            _projectsImage,
                            fit: BoxFit.cover,
                          );
                          // Rotate it to landscape
                          if (MediaQuery.of(context).orientation ==
                              Orientation.portrait) {
                            child = RotatedBox(quarterTurns: 5, child: child);
                          }
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                              child: InteractiveViewer(
                                maxScale: 3,
                                minScale: 1,
                                child: child,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
            child: Padding(
              padding: EdgeInsets.all(_smallScreen ? 0 : 40),
              child: Image.asset(_projectsImage),
            ),
          ),
        ),
        if (showPopup ?? true)
          Visibility(
            visible: _Content.visible,
            child: popup(context, fontSize: 18),
          ),
      ],
    );
  }

  /// The popup window describing the 'Five Why's' diagram.
  Widget popup(
    BuildContext context, {
    double? fontSize,
    bool? showLink,
    bool? readMore,
  }) {
    //
    final _showLink = showLink ?? true;

    // Display the 'read more' version if specified.
    final _readMore = readMore ?? true;

    final _smallScreen = context.inSmallScreen;

    final _screenSize = context.screenSize;

    final _landscape = context.isLandscape;

    const String _threeTreesImage = 'assets/images/three_trees.jpg';

    Widget threeTrees = Image.asset(
      _threeTreesImage,
      fit: BoxFit.cover,
    );
    // Make interactive if on a mobile phone.
    if (_smallScreen) {
      threeTrees = InteractiveViewer(
        maxScale: 3,
        minScale: 1,
        child: threeTrees,
      );
    }
    const String _fiveWhysImage = 'assets/images/five_whys.png';

    // The five-why's diagram.
    Widget fiveWhys = Image.asset(
      _fiveWhysImage,
      fit: BoxFit.cover,
    );

    // Make interactive if on a mobile phone.
    if (_smallScreen) {
      fiveWhys = InteractiveViewer(
        maxScale: 3,
        minScale: 1,
        child: fiveWhys,
      );
    }

    final textStyle = Theme.of(context).textTheme.bodyText2;

    const firstParagraph =
        "Simply put, 'garbage in; garbage out.' We have to clarify the requirements right from the start.";

    const secondParagraph =
        "The ‘5 Whys’ exercise is a good start. Conceived years ago by the Toyota Motor Corporation, it came about to help find the root cause to a problem. You simply ask ‘why?’ repeatedly to every answer to the previous question. The trick is to first establish the question that describes the basic overall problem you wish to address.\n\nNote, it doesn't always have to be 5 why’s. It’ll likely be more but, at times, even less. Also, there is the common trap of seemingly identifying the root cause when further why’s would have revealed it’s really not. Finally, make it a point to have other team members try it separately--different people using ‘5 Whys‘ may come up with different answers for the same problem. You will have to consolidate them with yours and try again.";

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * (_smallScreen ? 0.05 : 0.05),
          _screenSize.height * (_smallScreen ? 0.05 : 0.1),
          _screenSize.width *
              (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.05),
          _screenSize.height *
              (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.1),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 2),
            const Text(
              'How Projects Should Work',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: textStyle,
                    text:
                        'My concern is the first two pictures and the last picture in the famous cartoon: ',
                  ),
                  TextSpan(
                    style: textStyle!.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    text: 'Tree Swing',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        const url = 'https://archive.is/FgxPK';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => PopupPage.window<void>(
                context,
                (_) => Center(child: threeTrees),
                title: "The 5 Why's",
              ),
              child: Image.asset(
                _threeTreesImage,
                height: _screenSize.height * 0.35,
                width: _screenSize.width * (_smallScreen ? 1 : 0.25),
                fit: BoxFit.fill,
              ),
            ),
            if (_smallScreen)
              const AutoSizeText(firstParagraph)
            else
              const Text(firstParagraph),
            if (_readMore)
              TextButton(
                onPressed: () {
                  // this.readMore = false;
                  // StateSet.root!.setState(() {});
                  AppRouterDelegate.newRoute('/five_whys');
                },
                child: Text(
                  ' ...read more',
                  style: textStyle.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else if (_smallScreen)
              const AutoSizeText(secondParagraph)
            else
              const Text(secondParagraph),
            if (!_readMore)
              InkWell(
                onTap: () => PopupPage.window<void>(
                  context,
                  (_) => Center(child: fiveWhys),
                ),
                child: Image.asset(
                  _fiveWhysImage,
                  height: _screenSize.height * (_smallScreen ? 0.4 : 0.55),
                  width: _screenSize.width * (_smallScreen ? 1 : 0.65),
                  fit: BoxFit.fill,
                ),
              ),
            if (!_readMore)
              const Text(
                "Writing some 'Use Case Scenarios' will then pin down how a possible solution would work.",
                //             style: _textStyle,
              ),
            if (_showLink)
              TextButton(
                onPressed: () {
                  AppRouterDelegate.newRoute('/use_case');
                },
                child: Text(
                  'Use Case Scenarios',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: fontSize ?? 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//ignore: avoid_classes_with_only_static_members
class _Content {
  static bool visible = false;
}

class FiveWhys extends WebPage {
  FiveWhys({GlobalKey? key})
      : super(
          key: key ?? GlobalKey(debugLabel: 'FiveWhys'),
          title: 'How Projects Should Work',
          addFooter: true,
        );

  /// Main content
  @override
//  List<Widget>? withHeader04(BuildContext context, [WebPageWidget? widget]) {
  Widget? builder(BuildContext context) =>
      HowProjectsWork().popup(context, showLink: false, readMore: false);
}
