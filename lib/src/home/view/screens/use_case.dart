// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class UseCaseExample extends WebPage {
  UseCaseExample({
    Key? key,
    this.readMore = false,
    this.banner = true,
    bool? bottomBar,
    bool coverBanner = true,
  }) : super(
          _UseCaseExampleController(),
          key: key,
          bottomBar: bottomBar ?? true,
          coverBanner: coverBanner,
        );
  final bool? readMore;
  final bool banner;
  static const double offset = 2000;

  static const image =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F2.jpg?alt=media';

  @override
  String get title => 'Use Case';
}

class _UseCaseExampleController extends WebPageController {
  _UseCaseExampleController() : super();

  @override
  void initState() {
    super.initState();
    _widget = widget as UseCaseExample;
  }

  UseCaseExample? _widget;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        title: const Text('Use Case'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          )
        ],
      );

  @override
  Widget child(BuildContext context, [WebPage? widget]) {
    final _smallScreen = MyApp.inSmallScreen;
    final _screenSize = MyApp.screenSize;
    final _landscape = MyApp.inLandscape;
    final style = Theme.of(context).textTheme.bodyText2;
    // This may be called before the widget is even mounted.
    if (_widget == null && widget != null && widget is UseCaseExample) {
      _widget = widget;
    }
    return Stack(
      children: <Widget>[
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
              _screenSize.height * (_smallScreen ? 0.05 : 0.45),
              _screenSize.width *
                  (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.05),
              _screenSize.height *
                  (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.1),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(_smallScreen ? 5 : 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  'Use Case Scenarios',
                  style: TextStyle(fontSize: _smallScreen ? 24 : 48),
                ),
                const Divider(),
                if (_widget != null && !_widget!.readMore!)
                  AutoSizeText(
                    useCaseText,
                    style: style,
                    textAlign: TextAlign.justify,
                  ),
                if (_widget == null || _widget!.readMore!)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: style,
                          text: useCaseText.substring(0, 498),
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
      ],
    );
  }

  final useCaseText = '''
Help me help you to build the mobile app that you want. 

To give us a better idea, we are going to write up some Use Case Scenarios. They're 'little stories' essentially detailing how the app is suppose to work. They'll help better convey your idea, and help us develop your app faster.

They also give us an idea how long it will take to make your app. Generally, each 'step' in a Use Case Scenario represents a separate piece of code that will need to be written. The more steps; the more code.

Below is a Use Case Example: 

WITHDRAW MONEY FROM AN ATM MACHINE 

Primary actors: 
Customer 
ATM Technician 
Bank 

Basic Scenario: 
1.   Customer inserts debit card into the ATM and enters PIN. 
2.   ATM validates PIN. 
3.   ATM displays customer options. 
4.   Customer selects the option, Withdraw Cash. 
5.   ATM prompts the Customer for an amount. 
6.   Customer enters desired amount. 
7.   ATM prompts the Customer to print receipt or not. 
8.   Customer selects to print receipt or not. 
9.   Transaction sent to Bank to determine if sufficient funds and if at withdrawal limit. 
10. ATM dispenses money. 
11. Customer takes money and receipt or not. 
12. ATM prompts the Customer to end or to continue. 
13. Customer selects to end or to continue. 

Additional Alternate Scenarios: 
2a.   Customer PIN is not valid. 
2a1. ATM prompts the Customer to retry. 

7a.   Customer enters unavailable amount. 
7a1. ATM prompts the Customer to re-enter amount. 

7b.   ATM itself has insufficient funds to dispense to customer. 
7b1. ATM Technician is alerted. 
7b2. ATM notifies customer and prompts for lesser amount. 

13a.   Customer selects to end. 
13a1. ATM returns debit card to Customer. 

13b.   Customer selects to continue. 
13b1. ATM returns to step 3. 


See how that works? It's amazingly effective in developing a useful app. Of course, your Use Case scenarios will likely be many, more lengthy and complicated. You may have to make revisions over and over again, but you'll only make the mobile app that much better. 
                  ''';
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
