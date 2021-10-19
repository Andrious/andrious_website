
## 1.33.0
 October 19, 2021
- class WebPageContainer extends StatelessWidget {

## 1.32.0+2
 October 17, 2021
- 'v. ${App.version}    Copyright © 2021 | Andrious Solutions Ltd.'

## 1.32.0
 October 17, 2021
- Disclosure: margin: EdgeInsets.fromLTRB(_screenSize.width * 0.1,

## 1.31.0
 October 17, 2021
- List<Widget> children05(BuildContext context, [WebPage? widget]) =>
- children.add(paradox.child(context, paradox)!);
- static late Size _screenSize;
- Removed icon: const Icon(Icons.share),

## 1.30.4
 October 15, 2021
-  _screenSize.width * 0.05,

## 1.30.3
 October 15, 2021
- _screenSize.width * (_smallScreen ? 0.05 :

## 1.30.2
 October 15, 2021
 - _screenSize.width * (_smallScreen ? 0.1 :

## 1.30.1
 October 15, 2021
- _screenSize.width * (_smallScreen ? 0.99 :

## 1.30.0
 October 15, 2021
- s1: 'GITTER',
- if (!_smallScreen && (_widget?.banner ?? false))

## 1.29.0
 October 14, 2021
- # - directives_ordering
- builder: builder ?? (BuildContext context) => const SizedBox(),
- padding: EdgeInsets.only(top: _screenSize.height * 0.2, bottom: 32),
- this.readMore = readMore;
- export 'package:flutter/gestures.dart'; // for TapGestureRecognizer()

## 1.28.1
 October 11, 2021
- _wrapper = widget as WebPageWrapper;
- Widget? child(BuildContext context, [WebPage? widget]) => _wrapper!._child ?? super.child(context)!;

## 1.28.0
 October 10, 2021
- Widget coverPage(BuildContext context, {void Function()? onTap
- final textStyle = Theme.of(context).textTheme.bodyText2;
- if (inSmallScreen) AppTheme.fontSizeButton,
- lightThemeData.copyWith(textTheme: customTheme.textTheme.copyWith(

## 1.27.0
 October 09, 2021
- Map<String, Object> toJson() =>
- AppRoutePath fromJson(Map<String, dynamic> json) {
- abstract class BasicController extends ControllerMVC {
- if (mounted) { setState(() {});

## 1.26.0
 October 04, 2021
- abstract class BasicController extends ControllerMVC {
- Removed void initWidget();
- if (topMargin == null || topMargin == double.nan || topMargin < 0) {

## 1.25.0
 October 03, 2021
- Flutter UI Examples
- class PrivacyPolicy extends WebPage<PrivacyPolicy> {
- StackWidgetProperties? screenOverlay(BuildContext context) => null;
- Widget popupScreen(
- @mustCallSuper
  void initWidget() => _controller.initWidget();
- MyApp._(Key? key) : super(key: key, errorReport: _onErrorReport);

## 1.24.0
 September 28, 2021
- PopupPage.window<void>( in initial_disclosure
- if (banner && !_smallScreen) to  if (banner)

## 1.23.0
 September 28, 2021
- class WebPage<T>
- class WebPageWrapper extends WebPage<WebPageWrapper>
- Material(child: InkWell(

## 1.22.0+2
 September 27, 2021
- _screenSize.height * (_smallScreen ? 0.01 : 0.35),

## 1.21.0
 September 27, 2021
- _screenSize.height * (_smallScreen ? 0 : 0.35),

## 1.20.0+2
 September 27, 2021
- child: InteractiveViewer(

## 1.19.0
 September 27, 2021
- MyApp.orientation(context);

## 1.18.0
 September 27, 2021
- padding: EdgeInsets.all(_smallScreen ? 0 : 40),

## 1.17.0
 September 27, 2021
- Fixed five_whys.png
- padding: const EdgeInsets.all(8),

## 1.16.0
 September 27, 2021
- physics: const NeverScrollableScrollPhysics()
- const String _threeTreesImage = 'assets/images/three_trees.jpg';
- const String _fiveWhysImage = 'assets/images/five_whys.png';

## 1.15.0
 September 27, 2021
- PopupPage.window<void>(context, ownScreen);

## 1.14.3+6
 September 26, 2021
- Remove Material from GridView

## 1.14.3+5
 September 26, 2021
- _margin = MyApp.screenSize.width * 0.2;

## 1.14.3+2
 September 26, 2021
- padding: EdgeInsets.only(top: 8, left: 8, bottom: 8, right: _right),

## 1.14.2+4
 September 26, 2021
- right: MyApp.inSmallScreen ? 90 : 8

## 1.14.2+3
 September 26, 2021
- shrinkWrap: MyApp.inSmallScreen,

## 1.14.2+2
 September 26, 2021
- SingleChildScrollView(primary: false, child: GridView.builder(

## 1.14.2
 September 25, 2021
- if (banner && !_smallScreen)

## 1.14.1+3
 September 25, 2021
- SizedBox(child: InteractiveViewer(

## 1.14.0
 September 25, 2021
- disclose = InitialDisclosure(banner: false);

## 1.13.0
 September 25, 2021
- fit: _smallScreen ? BoxFit.fill : BoxFit.cover,
- child: InteractiveViewer(

## 1.12.0
 September 25, 2021
- _screenSize.width * (_smallScreen ? 0 : 0.2),
- if (!isSmallScreen && coverBanner)

## 1.11.0+4
 September 24, 2021
- final smallScreen = MyApp.inSmallScreen;
- controller.dart' hide AppController, runApp;
- firebase_installation.txt
- final _screenSize = MyApp.screenSize;
- AutoSizeText(

## 1.10.0
 September 21, 2021
- // List<IconData> icons = [
- _textStyle = TextStyle(fontSize: fontSize ?? 14);
- Remove FloatingQuickAccessBar(screen: this) from disclosure_agreement
- static bool inSmallScreen = false;
- Remove color  Colors.white, BoxDecoration( BorderRadius.circular(30),

## 1.9.0
 September 20, 2021
- static Future<bool> browseUri(String? uri) async {
- margin: EdgeInsets.fromLTRB(_screenSize.width * 0.15,

## 1.8.0
 September 19, 2021
- class ArticlesGrid extends WebPage<ArticlesGrid>
- FloatingQuickAccessBar(screen: this);
- _screenSize = screenSize ?? MediaQuery.of(context).size;
- const Hyperlink(this.child, this.url, {Key? key}) : super(key: key);
- final BasicState? basicState = StateSet.to<BasicState>();

## 1.7.0+2
 September 15, 2021
- flutter run --release -d chrome

## 1.7.0
 September 15, 2021
- Introduce Dart Packages

## 1.6.0
 September 11, 2021
- Introduce My Medium

## 1.5.0
 September 06, 2021
- Introduce 'small screen' pages

## 1.4.2
 September 02, 2021
- Deleted `web` directory

## 1.4.1
 September 02, 2021
- The Programming Paradox

## 1.4.0
 August 30, 2021
- New screens: Use Case & How Projects Really Work

## 1.3.0+2
 August 23, 2021
- updated app_navigator.dart

## 1.3.0
 August 23, 2021
- recent app_navigator.dart

## 1.2.0
 August 18, 2021
- new website

## 1.0.0
 August 13, 2021
- initial commit