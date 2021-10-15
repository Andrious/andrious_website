// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class HowProjectsWork extends WebPage {
  HowProjectsWork({Key? key, this.showPopup = true, this.readMore = false})
      : super(HowProjectsWorkController(), key: key);
  final bool showPopup;
  final bool readMore;
  static const double offset = 200;

  @override
  // Screen's title
  String get title => 'How Projects Really Work';

  // Access the its controller
  HowProjectsWorkController get controller =>
      webPageController as HowProjectsWorkController;

  Widget popup(BuildContext context,
          {double? fontSize, bool showLink = true}) =>
      HowProjectsWorkController().popup(
        context,
        fontSize: fontSize,
        showLink: showLink,
      );
}

class HowProjectsWorkController extends WebPageController {
  factory HowProjectsWorkController() =>
      _this ??= HowProjectsWorkController._();
  HowProjectsWorkController._() : super();
  static HowProjectsWorkController? _this;

  final String _projectsImage = 'assets/images/how_projects_work.jpg';

  @override
  void initState() {
    super.initState();
    _widget = widget as HowProjectsWork;
  }

  HowProjectsWork? _widget;

  // Flag indicating whether 'read more' option is displayed or not.
  bool readMore = false;

  @override
  List<Widget> children05(BuildContext context, [WebPage? widget]) {
    // MyApp.inSmallScreen allows this method to be called before the build() function.
    final _smallScreen = MyApp.inSmallScreen;
    // Sometimes this method is called before the widget is mounted.
    if (_widget == null && widget != null && widget is HowProjectsWork) {
      _widget = widget;
      readMore = _widget!.readMore;
    }
    return [
      Stack(
        children: [
          Center(
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: !_smallScreen
                  ? null
                  : () {
                      if (_widget?.showPopup ?? true) {
                        setState(() {
                          _Content.visible = !_Content.visible;
                        });
                      } else {
                        PopupPage.window<void>(
                          context,
                          (_) => Center(
                            child: Padding(
                              padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                              child: InteractiveViewer(
                                maxScale: 3,
                                minScale: 1,
                                child: Image.asset(
                                  _projectsImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
              child: Padding(
                padding: EdgeInsets.all(_smallScreen ? 0 : 40),
                child: Image.asset(_projectsImage),
              ),
            ),
          ),
          if (_widget?.showPopup ?? true)
            Visibility(
              visible: _Content.visible,
              // Method is below. Allowing to be called separately.
              child: popup(context, fontSize: 18),
            ),
        ],
      ),
    ];
  }

  /// The popup window describing the 'Five Why's' diagram.
  Widget popup(BuildContext context,
      {double? fontSize, bool showLink = true, bool? readMore}) {
    //

    // Display the 'read more' version if specified.
    if (readMore != null) {
      this.readMore = readMore;
    }

    final _smallScreen = MyApp.inSmallScreen;

    final _screenSize = MyApp.screenSize;

    final _landscape = MyApp.inLandscape;

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
          _screenSize.width * (_smallScreen ? 0.99 : 0.05),
          _screenSize.height * (_smallScreen ? 0.99 : 0.2),
          _screenSize.width * (_smallScreen ? (_landscape ? 1 : 0.99) : 0.05),
          _screenSize.height * (_smallScreen ? (_landscape ? 1 : 0.5) : 0.01),
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
            if (this.readMore)
              TextButton(
                onPressed: () {
                  this.readMore = false;
                  StateSet.root!.setState(() {});
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
            if (!this.readMore)
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
            if (!this.readMore)
              const Text(
                "Writing some 'Use Case Scenarios' will then pin down how a possible solution would work:",
                //             style: _textStyle,
              ),
            if (!this.readMore)
              TextButton(
                onPressed: () {
                  this.readMore = true;
                  StateSet.root!.setState(() {});
                },
                child: Text(
                  ' ...show less',
                  style: textStyle.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (showLink)
              TextButton(
                onPressed: () {
                  AppRouterDelegate.nextRoute('/use_case');
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
