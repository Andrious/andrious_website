// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class UseCaseExample extends WebPageWidget {
  UseCaseExample({
    GlobalKey? key,
//    Key? key,
    this.readMore = false,
    this.banner = false,
    bool? hasBottomBar,
  }) : super(
          key: key ?? LabeledGlobalKey('UseCaseExample'),
          title: 'Use Case',
          controller: _UseCaseExampleController(),
          hasBottomBar: hasBottomBar ?? true,
        );
  final bool? readMore;
  final bool banner;
  static const double offset = 2000;

  static const image =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F2.jpg?alt=media';
}

class _UseCaseExampleController extends WebPageController {
  _UseCaseExampleController() : super();

  @override
  void initState() {
    super.initState();
    _widget = widget as UseCaseExample;
  }

  UseCaseExample? _widget;

  /// Don't supply a widget.
  /// Instead, supply a list of widgets using buildList().
  @override
  Widget? builder(BuildContext context) => null;

  @override
  List<Widget>? buildList(BuildContext context) {
    //
    final _smallScreen = inSmallScreen;
    final _screenSize = screenSize;
    final _landscape = inLandscape;
    final style = Theme.of(context).textTheme.bodyText2;

    return [
      if (!_smallScreen && (_widget?.banner ?? false))
        Container(
          height: 300,
          width: double.infinity,
          child: Image.asset(
            'assets/images/phone_mist.jpg',
            fit: BoxFit.cover,
          ),
        ),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            _screenSize.width * (_smallScreen ? 0.05 : 0.05),
            _screenSize.height * (_smallScreen ? 0.05 : 0.1),
            _screenSize.width *
                (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.05),
            _screenSize.height *
                (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.1),
          ),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30),
          // ),
          padding: EdgeInsets.only(
              left: _smallScreen ? 5 : 10, right: _smallScreen ? 5 : 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // const Divider(),
              // const SizedBox(height: 10),
              Text(
                'Use Case Scenarios',
                style: TextStyle(fontSize: _smallScreen ? 24 : 48),
              ),
              const Divider(),
              if (_widget != null && !_widget!.readMore!)
                Column(children: [
                  Text(
                    useCase01,
                    style: style,
                    textAlign: TextAlign.justify,
                  ),
                  Image.asset(
                    'assets/images/use_case_example.jpg',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    useCase02,
                    style: style,
                    textAlign: TextAlign.justify,
                  ),
                ]),
              if (_widget == null || _widget!.readMore!)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: style,
                        text: useCase01.substring(0, 498),
                      ),
                      TextSpan(
                        style: style!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                        text: ' ...read more',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AppRouterDelegate.nextRoute('/use_case');
                          },
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    ];
  }

  final useCase01 =
      "Help me help you to build the mobile app that you want.\nTo give us a better idea, we are going to write up some Use Case Scenarios. They're 'little stories' essentially detailing how the; app is suppose to work. They'll help better convey your idea, and help us develop your app faster.\nThey also give us an idea how long it will take to make your app. Generally, each 'step' in a Use Case Scenario represents a separate piece of code that will need to be written. The more steps; the more code.\nBelow is a Use Case Example:";

  final useCase02 =
      "See how that works? It's amazingly effective in developing a useful app. Of course, your Use Case scenarios will likely be many, more lengthy and complicated. You may have to make revisions over and over again, but you'll only make the mobile app that much better.";
}

class PNetworkImage extends StatelessWidget {
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);
  final String image;
  final BoxFit? fit;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
