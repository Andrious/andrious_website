// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class PrivacyPolicy extends WebPage {
  PrivacyPolicy({Key? key})
      : super(
          _PrivacyPolicy(primary: false),
          key: key,
          title: 'Privacy Policy',
          coverBanner: false,
          accessBar: false,
          bottomBar: false,
        );
}

class _PrivacyPolicy extends WebPageController {
  _PrivacyPolicy({bool? primary}) : super(primary: primary);

  @override
  List<Widget>? children04(BuildContext context, [WebPage? widget]) {
    final _screenSize = screenSize;
    final _smallScreen = inSmallScreen;
    return [
      Container(
//          margin: const EdgeInsets.fromLTRB(300, 50, 300, 150),
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * (_smallScreen ? 0 : 0.2),
          _screenSize.height * (_smallScreen ? 0.1 : 0.25),
          _screenSize.width * (_smallScreen ? 0.0 : 0.2),
          _screenSize.height * (_smallScreen ? 0.1 : 0.25),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(_smallScreen ? 10 : 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 18),
            AutoSizeText(
              "Online Privacy\n\nFrom the start Andrious Solutions Ltd. has conducted its business around the world with integrity and the highest level of trust. Be assured, we will not share any information you consent to share with us.\n\nNon-Personal Information\n\nIn general, you may visit Andrious Solutions Ltd. on the World Wide Web without telling us who you are or revealing any information about yourself. We may collect the domain names, not the e-mail addresses, of visitors. Also, we may collect and store other information about your visit on an anonymous, aggregate basis. This information may include the time and length of your visit, the pages you look at on our sites, and the site you visited just before coming to ours. We may also record the name of your Internet service provider, browser type, and country of origin. We use this information only to measure site activity and to develop ideas for improving our sites.\n\nPersonal Information\n\nAndrious Solutions Ltd. may ask you to provide information that personally identifies you, such as name, e-mail address, mailing address or phone number ('Personal Information'). This will occur only in special circumstances. We may use your Personal Information for three primary purposes. Collect, analyze, segment, identify metrics and build reports that rely on common analytic tools and services. Creation of online marketing dashboards that depict key metrics related to traffic information, conversion rates, online customer behavior / experience, etc. Integrate analytic insights to drive recommendations across multiple platforms and programs.\n\nCookies / Tags\n\n'Cookies' are small pieces of information that are stored by your browser on your computer's hard drive. Our cookies do not contain any personally identifying information. They only contain a secure identifying code that we use to match you to your Personal Information whenever you return to our site. Your Personal Information is never directly connected to nor stored on your computer, but is accessed when we identify your cookie to provide you with a more personalized experience when visiting our site.\n\nWhat Information Do We Collect?\n\nThe type of information we maintain falls into two categories. The first is general information, typically a supplied by you email address and for specific programs we may request a name, billing address, e-mail address, company name, etc. with your consent. We do not store credit card information as part of your Personal Information. We also store information about how you navigate our site so that when you return to it again, we may present you with a more efficient, personalized experience based upon your interests and needs. As we continue to develop the website, we hope to continually increase the personally customized quality of your browsing experiences. Andrious Solutions Ltd. reserves the right to alter our privacy principles as business needs require. Any alterations to these principles will be posted on our web site in a timely manner.\n\nPlease feel free to contact us with any questions, comments, or concerns.",
            ),
          ],
        ),
      )
    ];
  }
}
