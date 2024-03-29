// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ShrinePolicy extends WebPage {
  ShrinePolicy({GlobalKey? key})
      : super(
          key: key ?? LabeledGlobalKey('PrivacyPolicy'),
          title: 'Privacy Policy',
          addFooter: false,
        );

  @override
  Widget? builder(BuildContext context) {
    final _screenSize = screenSize;
    final _smallScreen = inSmallScreen;
    return Container(
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
        children: [
          const Text(
            'Privacy Policy',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 18),
          HtmlWidget(
            // the first parameter (`html`) is required
            '''
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0031)https://www.andrioussolutions.com/privacy.html -->
<html data-darkreader-mode="dynamic" data-darkreader-scheme="dark"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style class="darkreader darkreader--fallback" media="screen"></style><style class="darkreader darkreader--text" media="screen"></style><style class="darkreader darkreader--invert" media="screen">.jfk-bubble.gtx-bubble, .captcheck_answer_label > input + img, span#closed_text > img[src^="https://www.gstatic.com/images/branding/googlelogo"], span[data-href^="https://www.hcaptcha.com/"] > #icon, #bit-notification-bar-iframe, ::-webkit-calendar-picker-indicator {
    filter: invert(100%) hue-rotate(180deg) contrast(90%) !important;
}</style><style class="darkreader darkreader--inline" media="screen">[data-darkreader-inline-bgcolor] {
  background-color: var(--darkreader-inline-bgcolor) !important;
}
[data-darkreader-inline-bgimage] {
  background-image: var(--darkreader-inline-bgimage) !important;
}
[data-darkreader-inline-border] {
  border-color: var(--darkreader-inline-border) !important;
}
[data-darkreader-inline-border-bottom] {
  border-bottom-color: var(--darkreader-inline-border-bottom) !important;
}
[data-darkreader-inline-border-left] {
  border-left-color: var(--darkreader-inline-border-left) !important;
}
[data-darkreader-inline-border-right] {
  border-right-color: var(--darkreader-inline-border-right) !important;
}
[data-darkreader-inline-border-top] {
  border-top-color: var(--darkreader-inline-border-top) !important;
}
[data-darkreader-inline-boxshadow] {
  box-shadow: var(--darkreader-inline-boxshadow) !important;
}
[data-darkreader-inline-color] {
  color: var(--darkreader-inline-color) !important;
}
[data-darkreader-inline-fill] {
  fill: var(--darkreader-inline-fill) !important;
}
[data-darkreader-inline-stroke] {
  stroke: var(--darkreader-inline-stroke) !important;
}
[data-darkreader-inline-outline] {
  outline-color: var(--darkreader-inline-outline) !important;
}
[data-darkreader-inline-stopcolor] {
  stop-color: var(--darkreader-inline-stopcolor) !important;
}</style><style class="darkreader darkreader--variables" media="screen">:root {
   --darkreader-neutral-background: #131516;
   --darkreader-neutral-text: #d8d4cf;
   --darkreader-selection-background: #004daa;
   --darkreader-selection-text: #e8e6e3;
}</style><style class="darkreader darkreader--root-vars" media="screen"></style><style class="darkreader darkreader--user-agent" media="screen">html {
    background-color: #181a1b !important;
}
html {
    color-scheme: dark !important;
}
html, body, input, textarea, select, button {
    background-color: #181a1b;
}
html, body, input, textarea, select, button {
    border-color: #736b5e;
    color: #e8e6e3;
}
a {
    color: #3391ff;
}
table {
    border-color: #545b5e;
}
::placeholder {
    color: #b2aba1;
}
input:-webkit-autofill,
textarea:-webkit-autofill,
select:-webkit-autofill {
    background-color: #404400 !important;
    color: #e8e6e3 !important;
}
::-webkit-scrollbar {
    background-color: #202324;
    color: #aba499;
}
::-webkit-scrollbar-thumb {
    background-color: #454a4d;
}
::-webkit-scrollbar-thumb:hover {
    background-color: #575e62;
}
::-webkit-scrollbar-thumb:active {
    background-color: #484e51;
}
::-webkit-scrollbar-corner {
    background-color: #181a1b;
}
::selection {
    background-color: #004daa !important;
    color: #e8e6e3 !important;
}
::-moz-selection {
    background-color: #004daa !important;
    color: #e8e6e3 !important;
}</style>
	
	<title>Andrious Solutions Ltd. - Privacy Policy</title>
	<meta name="CHANGEDBY" content="Greg Perry">
	<meta name="DESCRIPTION" content="Andrious Solutions Ltd. - Privacy Policy">
	<style type="text/css">
	<!--
		@page { size: 8.5in 11in; margin-left: 1in; margin-right: 1in; margin-top: 0.5in; margin-bottom: 0.5in }
		P { margin-bottom: 0.08in; direction: ltr; line-height: 100%; page-break-inside: avoid; widows: 2; orphans: 2; page-break-after: avoid }
		P.western { font-family: "Times New Roman", serif }
		P.ctl { font-family: "Times New Roman" }
		H1 { margin-top: 0.33in; margin-bottom: 0.33in; direction: ltr; line-height: 100%; page-break-inside: avoid; widows: 2; orphans: 2 }
		H1.western { font-family: "Times New Roman", serif; font-size: 20pt }
		H1.cjk { font-size: 20pt }
		H1.ctl { font-family: ; font-size: 20pt }
		A:link { color: #0000ff; so-language: zxx }
	-->
	</style><style class="darkreader darkreader--sync" media="screen"></style>
<meta name="darkreader" content="1402277126154f24b834a9117672dfe1"><style class="darkreader darkreader--override" media="screen">.vimvixen-hint {
    background-color: #7b5300 !important;
    border-color: #d8b013 !important;
    color: #f3e8c8 !important;
}
::placeholder {
    opacity: 0.5 !important;
}
#edge-translate-panel-body,
.MuiTypography-body1 {
    color: var(--darkreader-neutral-text) !important;
}
gr-main-header {
    background-color: #0f3a48 !important;
}
embed[type="application/pdf"][src="about:blank"] { filter: invert(100%) contrast(90%); }</style></head>
<body lang="en-US" link="#0000ff" dir="LTR" data-new-gr-c-s-check-loaded="14.1056.0" data-gr-ext-installed="">
<div type="HEADER">
	<p style="margin-bottom: 0.46in"><br>
	</p>
</div>
<h1 class="western" align="CENTER" style="margin-top: 0in; margin-bottom: 0in; page-break-after: auto">
<font face="Arial, serif"><font size="2" style="font-size: 11pt">PRIVACY
POLICY</font></font></h1>
<p class="western" style="margin-bottom: 0in; page-break-after: auto">
 
</p>
<p class="western" style="margin-bottom: 0in; page-break-after: auto">
<font face="Arial, serif">Effective date: 11/04/2022</font></p>
<p class="western" style="margin-bottom: 0in; page-break-after: auto">
 
</p>
<ol>
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Introduction</b></u></font></p>
</li></ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">Welcome to&nbsp;</font><font face="Arial, serif"><b>Andrious Solutions Ltd.</b></font><font face="Arial, serif">.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Andrious Solutions Ltd.&nbsp;(“us”, “we”, or
“our”) operates&nbsp;Shrine Flutter Demo Only&nbsp;(hereinafter
referred to as “</font><font face="Arial, serif"><b>the App</b></font><font face="Arial, serif">”).</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Our Privacy Policy governs your visit
to&nbsp;Shrine Flutter Demo Only App, and explains we do not collect,
or disclose any of your personal information through the course of using our App. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Our Terms and Conditions (“</font><font face="Arial, serif"><b>Terms</b></font><font face="Arial, serif">”)
govern all use of our App and together with the Privacy Policy
constitutes your agreement with us (“</font><font face="Arial, serif"><b>agreement</b></font><font face="Arial, serif">”).</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="2">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Definitions</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>SERVICE&nbsp;</b></font><font face="Arial, serif">means
the&nbsp;Wishpy mobile application&nbsp;operated by&nbsp;Nomad
Studio.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>PERSONAL DATA</b></font><font face="Arial, serif">&nbsp;means
data about a living individual who can be identified from those data
(or from those and other information either in our possession or
likely to come into our possession).</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>USAGE DATA</b></font><font face="Arial, serif">&nbsp;is
data collected automatically either generated by the use of App
or from App infrastructure itself.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>COOKIES</b></font><font face="Arial, serif">&nbsp;are
small files stored on your device (computer or mobile device).</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>DATA CONTROLLER</b></font><font face="Arial, serif"><span lang="uk-UA">&nbsp;means
a natural or legal person who (either alone or jointly or in common
with other persons) determines the purposes for which and the manner
in which any personal data are, or are to be, processed. For the
purpose of this Privacy Policy, we are a Data Controller of your
data.</span></font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>DATA SUBJECT&nbsp;</b></font><font face="Arial, serif">is
any living individual who is the subject of Personal Data.</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif"><b>THE USER&nbsp;</b></font><font face="Arial, serif">is
the individual using our App. The User corresponds to the Data
Subject, who is the subject of Personal Data.</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="3">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Information Collection and Use</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We currently do not collect any information during your use of our App.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="4">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Types of Data Collected</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif"><b>Personal Data</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">While using our App, it may access certain personally identifiable information that can
be used to identify you (“</font><font face="Arial, serif"><b>Personal
Data</b></font><font face="Arial, serif">”). Personally
identifiable information may include, but is not limited to:</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">Cookies and Usage Data</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif"><b>Usage Data</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We will not explicitly collect any such information (“</font><font face="Arial, serif"><b>Usage
Data</b></font><font face="Arial, serif">”).</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">This Usage Data may include information
such as your computer's Internet Protocol address (e.g. IP address),
browser type, browser version, the pages of our App that you
visit, the time and date of your visit, the time spent on those
pages, unique device identifiers and other diagnostic data.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">When you access App with a mobile
device, this Usage Data may include information such as the type of
mobile device you use, your mobile device unique ID, the IP address
of your mobile device, your mobile operating system, the type of
mobile Internet browser you use, unique device identifiers and other
diagnostic data.</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.2in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif"><b>Tracking Cookies Data</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We use cookies and similar tracking
technologies to track the activity on our App and we hold certain
information.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Cookies are files with a small amount of
data which may include an anonymous unique identifier. Cookies are
sent to your browser from a website and stored on your device. Other
tracking technologies are also used such as beacons, tags and scripts
to collect and track information and to improve and analyze our
App.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">You can instruct your browser to refuse all
cookies or to indicate when a cookie is being sent. However, if you
do not accept cookies, you may not be able to use some portions of
our App.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">Examples of Cookies we use:</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<ol>
	<ol type="a">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>Session Cookies:</b></font><font face="Arial, serif">&nbsp;We
		use Session Cookies to operate our App.</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>Preference Cookies:</b></font><font face="Arial, serif">&nbsp;We
		use Preference Cookies to remember your preferences and various
		settings.</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="3">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>Security Cookies:</b></font><font face="Arial, serif">&nbsp;We
		use Security Cookies for security purposes.</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="5">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Use of Data</b></u></font></p>
</li></ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">Andrious Solutions Ltd.&nbsp;will not collect or use any such data.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="6">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Retention of Data</b></u></font></p>
</li></ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We will only retain and use your Personal Data to the extent
necessary to comply with our legal obligations (for example, if we
are required to retain your data to comply with applicable laws),
resolve disputes, and enforce our legal agreements and policies.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We will also retain Usage Data for internal
analysis purposes. Usage Data is generally retained for a shorter
period, except when this data is used to strengthen the security or
to improve the functionality of our App, or we are legally
obligated to retain this data for longer time periods.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="7">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Transfer of Data</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Your information, including Personal Data,
will not be transferred to – or maintained on – computers located
outside of your state, province, country or other governmental
jurisdiction without your explicit consent.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Your consent to this Privacy Policy
followed by your submission of such information represents your
agreement to that transfer.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-right: 0in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Andrious Solutions Ltd.&nbsp;will take all the steps
reasonably necessary to ensure that your data will not be collected
in accordance with this Privacy Policy and no transfer of your
Personal Data will take place to an organisation or a country under any circumstances.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="8">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Disclosure of Data</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">We may disclose personal information that
we collect, or you provide:</font></p>
<p class="western" style="margin-bottom: 0in; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
		<font face="Arial, serif"><b>Disclosure for Law Enforcement.</b></font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Under other circumstances, we may be
required to disclose your Personal Data by law to public authorities,
 but this is not the case as no just data is collected.</font></p>
<p class="western" style="margin-left: 0.3in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
		<font face="Arial, serif"><b>Business Transaction.</b></font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">If we or our subsidiaries are involved in a
merger, acquisition or asset sale, no Personal Data will be
transferred:</font></p>
<p align="JUSTIFY" style="margin-left: 0.75in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="2">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">to contractors, service providers, and
			other third parties we use to support our business;</font></p>
		</li></ol>
	</ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.75in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="5">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">with your consent in any other cases;</font></p>
		</li></ol>
	</ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.75in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="6">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">if we believe disclosure is necessary or
			appropriate to protect the rights, property, or safety of the
			Company, our customers, or others.</font></p>
		</li></ol>
	</ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.75in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="9">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Security of Data</b></u></font></p>
</li></ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">The security of your data is important to
us but remember that no method of transmission over the Internet or
method of electronic storage is 100% secure. While we strive to use
commercially acceptable means to protect your Personal Data, we
cannot guarantee its absolute security.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="10">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Your Data Protection Rights Under
	General Data Protection Regulation (GDPR)</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">If you are a resident of the European Union
(EU) and European Economic Area (EEA), you have certain data
protection rights, covered by GDPR. – See more at
https://eur-lex.europa.eu/eli/reg/2016/679/oj </font>
</p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We aim to take reasonable steps to allow
you to correct, amend, delete, or limit the use of your Personal
Data.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">If you wish to be informed what Personal
Data we hold about you and if you want it to be removed from our
systems, please email us at heywishpy+support@gmail.com. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">In certain circumstances, you have the
following data protection rights:</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<ol>
	<ol type="a">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right to access, update or to delete
		the information we have on you;</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right of rectification. You have the
		right to have your information rectified if that information is
		inaccurate or incomplete;</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="3">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right to object. You have the right
		to object to our processing of your Personal Data;</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="4">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right of restriction. You have the
		right to request that we restrict the processing of your personal
		information;</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="5">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right to data portability. You have
		the right to be provided with a copy of your Personal Data in a
		structured, machine-readable and commonly used format;</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="6">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">the right to withdraw consent.&nbsp;You
		also have the right to withdraw your consent at any time where we
		rely on your consent to process your personal information;</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Please note that we may ask you to verify
your identity before responding to such requests. Please note, we may
not able to provide App without some necessary data.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">You have the right to complain to a Data
Protection Authority about our collection and use of your Personal
Data. For more information, please contact your local data protection
authority in the European Economic Area (EEA).</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="11">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Your Data Protection Rights under
	the California Privacy Protection Act (CalOPPA)</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">CalOPPA is the first state law in the
nation to require commercial websites and online services to post a
privacy policy. The law’s reach stretches well beyond California to
require a person or company in the United States (and conceivable the
world) that operates websites collecting personally identifiable
information from California consumers to post a conspicuous privacy
policy on its website stating exactly the information being collected
and those individuals with whom it is being shared, and to comply
with this policy. – See more at:
https://consumercal.org/about-cfc/cfc-education-foundation/california-online-privacy-protection-act-caloppa-3/
</font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">According to CalOPPA we agree to the
following:</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
 
</p>
<ol>
	<ol type="a">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">users can visit our site anonymously;</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">our Privacy Policy link includes the word
		“Privacy”, and can easily be found on the page specified above
		on the home page of our website;</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="3">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">users will be notified of any privacy
		policy changes on our Privacy Policy Page;</font></p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="4">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif">users are able to change their personal
		information by emailing us at heywishpy+support@gmail.com. </font>
		</p>
	</li></ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">Our Policy on “Do Not Track” Signals:</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">We honor Do Not Track signals and do not
track, plant cookies, or use advertising when a Do Not Track browser
mechanism is in place. Do Not Track is a preference you can set in
your web browser to inform websites that you do not want to be
tracked. </font>
</p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">You can enable or disable Do Not Track by
visiting the Preferences or Settings page of your web browser.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="12">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Your Data Protection Rights under
	the California Consumer Privacy Act (CCPA)</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">If you are a California resident, you are
entitled to learn what data we collect about you, ask to delete your
data and not to sell (share) it. To exercise your data protection
rights, you can make certain requests and ask us:</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<ol>
	<ol type="a">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>What personal information we have
		about you</b></font><font face="Arial, serif">. If you make this
		request, we will return to you:</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">The categories of personal information
			we have collected about you.</font></p>
		</li></ol>
	</ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.75in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="2">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">The categories of sources from which we
			collect your personal information.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="3">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">The business or commercial purpose for
			collecting or selling your personal information.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="4">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">The categories of third parties with
			whom we share personal information.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="5">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">The specific pieces of personal
			information we have collected about you.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="6">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">A list of categories of personal
			information that we have sold, along with the category of any
			other company we sold it to. If we have not sold your personal
			information, we will inform you of that fact.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a">
		<ol type="i" start="7">
			<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
			<font face="Arial, serif">A list of categories of personal
			information that we have disclosed for a business purpose, along
			with the category of any other company we shared it with.</font></p>
		</li></ol>
	</ol>
</ol>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Please note, you are entitled to ask us to
provide you with this information up to two times in a rolling
twelve-month period. When you make this request, the information
provided may be limited to the personal information we collected
about you in the previous 12&nbsp;months.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="2">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>To delete your personal information</b></font><font face="Arial, serif">.
		If you make this request, we will delete the personal information
		we hold about you as of the date of your request from our records
		and direct any service providers to do the same. In some cases,
		deletion may be accomplished through de-identification of the
		information. If you choose to delete your personal information, you
		may not be able to use certain functions that require your personal
		information to operate.</font><font face="Arial, serif"><b> </b></font>
		</p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol>
	<ol type="a" start="3">
		<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
		<font face="Arial, serif"><b>To stop selling your personal
		information</b></font><font face="Arial, serif">. We don't sell or
		rent your personal information to any third parties for any
		purpose. You are the only owner of your Personal Data and can
		request disclosure or deletion at any time.</font></p>
	</li></ol>
</ol>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Please note, if you ask us to delete or
stop selling your data, it may impact your experience with us, and
you may not be able to participate in certain programs or membership
services which require the usage of your personal information to
function. But in no circumstances, we will discriminate against you
for exercising your rights.</font></p>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">To exercise your California data protection
rights described above, please send your request(s) by one of the
following means:</font></p>
<p align="JUSTIFY" style="margin-left: 0.49in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">By visiting this page on our website:
https://www.andrioussolutions.com/contact</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.5in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif">Your
data protection rights, described above, are covered by the CCPA,
short for the California Consumer Privacy Act. To find out more,
visit the official California Legislative Information website. The
CCPA took effect on 01/01/2020. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<ol start="13">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Service Providers</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We may employ third party companies and
individuals to facilitate our App (“</font><font face="Arial, serif"><b>Service
Providers</b></font><font face="Arial, serif">”), provide Service
on our behalf, perform Service-related services or assist us in
analysing how our App is used.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">These third parties have access to your
Personal Data only to perform these tasks on our behalf and are
obligated not to disclose or use it for any other purpose.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="14">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Analytics</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">We may use third-party Service Providers to
monitor and analyze the use of our App.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><b><font face="Arial, serif">Google
Analytics</font></b></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Google Analytics is a web analytics service
offered by Google that tracks and reports website traffic. Google
uses the data collected to track and monitor the use of our App.
This data is shared with other Google services. Google may use the
collected data to contextualise and personalise the ads of its own
advertising network.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on the privacy
practices of Google, please visit the Google Privacy Terms web page:
https://policies.google.com/privacy?hl=en</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We also encourage you to review the
Google's policy for safeguarding your data:
https://support.google.com/analytics/answer/6004245.</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif"><b>Firebase</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Firebase is analytics service provided by
Google Inc.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">You may opt-out of certain Firebase
features through your mobile device settings, such as your device
advertising settings or by following the instructions provided by
Google in their Privacy Policy:
https://policies.google.com/privacy?hl=en</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on what type of
information Firebase collects, please visit the Google Privacy Terms
web page: https://policies.google.com/privacy?hl=en</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="15">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>CI/CD tools</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif">We
may use third-party Service Providers to automate the development
process of our App. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif"><b>GitHub</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">GitHub is provided by GitHub, Inc.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">GitHub is a development platform to host
and review code, manage projects, and build software.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on what data GitHub
collects for what purpose and how the protection of the data is
ensured, please visit GitHub Privacy Policy page:</font><font color="#0000ff" data-darkreader-inline-color="" style="--darkreader-inline-color:#337dff;"><font face="Arial, serif"><u>
</u></font></font><a href="https://help.github.com/en/articles/github-privacy-statement"><font face="Arial, serif">https://help.github.com/en/articles/github-privacy-statement.</font></a></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif"><b>GitLab
CI/CD</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">GitLab CI/CD is provided by GitLab, Inc.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">GitLab CI (Continuous Integration) service
is a part of GitLab that build and test the software whenever
developer pushes code to application. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">GitLab CD (Continuous Deployment) is a
software service that places the changes of every code in the
production which results in every day deployment of production. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on what data GitLab
CI/CD collects for what purpose and how the protection of the data is
ensured, please visit GitLab CI/CD Privacy Policy page:
https://about.gitlab.com/privacy/.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif"><b>Fastlane</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Fastlane is provided by Google, Inc. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Fastlane is a continuous delivery tool for
iOS and Android apps. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on what data Fastlane
collects for what purpose and how the protection of the data is
ensured, please visit the Google Privacy Policy page:
https://policies.google.com/privacy. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"><font face="Arial, serif"><b>CircleCI</b></font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in"> 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">CircleCI is provided by Circle Internet
Services, Inc. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">CircleCI is Continuous Integration, a
development practice which is being used by software teams allowing
them to build, test and deploy applications easier and quicker on
multiple platforms. </font>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">For more information on what data Circle CI
collects for what purpose and how the protection of the data is
ensured, please visit Circle CI Privacy Policy page:
https://circleci.com/privacy/. </font>
</p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<span style="background: rgb(0, 255, 0); --darkreader-inline-bgimage: initial; --darkreader-inline-bgcolor:#33cc00;" data-darkreader-inline-bgimage="" data-darkreader-inline-bgcolor=""> </span>
</p>
<ol start="16">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Payments</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We may provide paid products and/or
services within App. In that case, we use third-party services
for payment processing (e.g. payment processors).</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We will not store or collect your payment
card details. That information is provided directly to our
third-party payment processors whose use of your personal information
is governed by their Privacy Policy. These payment processors adhere
to the standards set by PCI-DSS as managed by the PCI Security
Standards Council, which is a joint effort of brands like Visa,
Mastercard, American Express and Discover. PCI-DSS requirements help
ensure the secure handling of payment information.</font></p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in">
<font face="Arial, serif">The payment processors we work with are:</font></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-after: auto">
 
</p>
<p align="LEFT" style="margin-left: 0.25in; margin-bottom: 0in"><b><font face="Arial, serif">PayPal
or Braintree:</font></b></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Their Privacy Policy can be viewed
at&nbsp;https://www.paypal.com/webapps/mpp/ua/privacy-full</font></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="LEFT" style="margin-left: 0.25in; margin-bottom: 0in"><b><font face="Arial, serif">Apple
Store In-App Payments:</font></b></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Their Privacy Policy can be viewed at:
https://www.apple.com/legal/privacy/en-ww/ /
https://support.apple.com/en-us/HT203027 </font>
</p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="LEFT" style="margin-left: 0.25in; margin-bottom: 0in"><b><font face="Arial, serif">Google
Play In-App Payments:</font></b></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Their Privacy Policy can be viewed at:
https://policies.google.com/privacy?hl=en&amp;gl=us /
https://payments.google.com/payments/apis-secure/u/0/get_legal_document?ldo=0&amp;ldt=privacynotice&amp;ldl=en
</font>
</p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="LEFT" style="margin-left: 0.25in; margin-bottom: 0in"><b><font face="Arial, serif">Stripe:</font></b></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Their Privacy Policy can be viewed at:
https://stripe.com/us/privacy</font></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="17">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Links to Other Sites</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">Our App may contain links to other
sites that are not operated by us. If you click a third party link,
you will be directed to that third party's site. We strongly advise
you to review the Privacy Policy of every site you visit.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<u> </u>
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We have no control over and assume no
responsibility for the content, privacy policies or practices of any
third party sites or services.</font></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="18">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Children's Privacy</b></u></font></p>
</li></ol>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font color="#000000" data-darkreader-inline-color="" style="--darkreader-inline-color:#e8e6e3;"><span style="background: rgb(255, 255, 255); --darkreader-inline-bgimage: initial; --darkreader-inline-bgcolor:#181a1b;" data-darkreader-inline-bgimage="" data-darkreader-inline-bgcolor=""> </span></font>
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in">
<font face="Arial, serif">Our Services are not intended for use by
children under the age of 18 (“</font><font face="Arial, serif"><b>Child</b></font><font face="Arial, serif">”
or “</font><font face="Arial, serif"><b>Children</b></font><font face="Arial, serif">”).
</font>
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in">
 
</p>
<p class="western" align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in">
<font face="Arial, serif">We do not knowingly collect personally
identifiable information from Children under 18. If you become aware
that a Child has provided us with Personal Data, please contact us.
If we become aware that we have collected Personal Data from Children
without verification of parental consent, we take steps to remove
that information from our servers.</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<ol start="19">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Changes to This Privacy Policy</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We may update our Privacy Policy from time
to time. We will notify you of any changes by posting the new Privacy
Policy on this page.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">We will let you know via email and/or a
prominent notice on our App, prior to the change becoming
effective and update “effective date” at the top of this Privacy
Policy.</font></p>
<p class="western" align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">You are advised to review this Privacy
Policy periodically for any changes. Changes to this Privacy Policy
are effective when they are posted on this page.</font></p>
<p class="western" style="margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<ol start="20">
	<li><p align="JUSTIFY" style="margin-bottom: 0in; page-break-inside: auto">
	<font face="Arial, serif"><u><b>Contact Us</b></u></font></p>
</li></ol>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<u> </u>
</p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
<font face="Arial, serif">If you have any questions about this
Privacy Policy, please contact us:</font></p>
<p align="JUSTIFY" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto">
 
</p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
<font face="Arial, serif">By visiting this page on our website:
https://www.andrioussolutions.com/contact.</font></p>
<p class="western" style="margin-left: 0.25in; margin-bottom: 0in; page-break-inside: auto; page-break-after: auto">
 
</p>
<div type="FOOTER">
	<p align="RIGHT" style="margin-top: 0.46in; margin-bottom: 0in"><sdfield type="PAGE" subtype="RANDOM" format="PAGE">16</sdfield></p>
</div>

</body>
</html>
  ''',
            // specify custom styling for an element
            // see supported inline styling below
            customStylesBuilder: (element) {
              if (element.classes.contains('foo')) {
                return {'color': 'red'};
              }
              return null;
            },

            // // render a custom widget
            // customWidgetBuilder: (element) {
            //   if (element.attributes['foo'] == 'bar') {
            //   }
            //
            //   return null;
            // },

            // turn on selectable if required (it's disabled by default)
//            isSelectable: true,

            // these callbacks are called when a complicated element is loading
            // or failed to render allowing the app to render progress indicator
            // and fallback widget
            onErrorBuilder: (context, element, error) =>
                Text('$element error: $error'),
            onLoadingBuilder: (context, element, loadingProgress) =>
                const CircularProgressIndicator(),

            // this callback will be triggered when user taps a link
            onTapUrl: (url) async {
              print('tapped $url');
              return true;
            },

            // by default, a simple `Column` is rendered
            // consider using `ListView` or `SliverList` for better performance
            renderMode: RenderMode.listView, //RenderMode.column,

//            textStyle: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
