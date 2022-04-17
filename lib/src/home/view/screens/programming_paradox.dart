// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ProgrammingParadox extends WebPageWidget {
  ProgrammingParadox({
    GlobalKey? key,
    this.readMore = false,
    bool hasBottomBar = true,
  }) : super(
          key: key ?? LabeledGlobalKey('ProgrammingParadox'),
          title: 'The Programming Paradox',
          controller: _ProgrammingParadoxController(),
          hasBottomBar: hasBottomBar,
        );
  final bool? readMore;

  // Scroll to position
  static const double offset = 3600;
}

class _ProgrammingParadoxController extends WebPageController {
  ProgrammingParadox? parentWidget;

  // @override
  //  List<Widget> withHeader04(BuildContext context, [WebPageWidget? widget]) {
  @override
  Widget builder(BuildContext context) {
    //
    final _screenSize = screenSize;

    final _smallScreen = inSmallScreen;

    parentWidget = widget as ProgrammingParadox;

    final textStyle = Theme.of(context).textTheme.bodyText2;

    const String text =
        "There’s something amazing about computer programming languages:\nThey're such versatile and multifaceted tools;  you can literally write three separate programs, each in three different ways using the same programming language and yet all three will essentially do the same thing.\n\nHowever, there's a big problem with computer programming languages:\nThey're such versatile and multifaceted tools; you can literally write three separate programs, each in three different ways using the same programming language and yet all three will essentially do the same thing.\n\nIf you hired Michael Crichton and two other novelists to write a story about resurrected dinosaurs running amok on some deserted island, you'd get three different novels. The same goes for three separate programs written in the same programming language by three separate programmers. Each program may do exactly the same thing, but one can tell each was written by a separate programmer!\n\nThat's just the nature of a scriptic language! You can write a sentence in more than one way to convey the same meaning; you can write code in more than one way to accomplish the same task. Computer programming languages were designed to be the answer to all things. They're to be adaptive to every industry, to every field, to every situation and circumstance. Thus, there's almost always more than one way to write the code to accomplish the same task.\n\nHowever, this great adaptive strength reveals one great weakness---we mere mortals are then tasked to work with programming languages. Programming languages really do 'separate the wheat from the chaff' when it comes to programmers. Enforcing one standard approach would only hamper its greatest strength, but allowing any approach really reveals the degree of skill in the programmer or the lack there of---resulting in delays and overruns, and really frustrating those paying for these computer programs. After all, time is money.\n\nNow, many might not believe what I’ve just stated here, but who wants to hire three programmers to write the same program and find out?! However, just as many do believe it, but not before they had to hire yet another programmer to fix the mess left by the first one or two.\n\nIt’s an unnerving fact---particularly for those paying for the computer programs. I mean, who wants to pay three different mechanics to work on their car's engine in three different ways, right? Pretty much impossible, of course, when it comes to car engines. Their parts usually only fit together one way. However, many of those paying for computer programs think programming is like building a car engine--just put the pieces together. No, it's like writing a novel. And like novels, they can vary in quality.\n\nPut another way, programming languages allow you to write magnificent code and programming languages allow you to write horrible code to perform essentially the same thing! Multi-billon dollar industries don’t want you to know this, but computer programming is complicated and time-consuming.\n\nUnless, of course, you’ve kept together pieces of code from past projects so to complete the next project that much faster. Tested, reliable code collected in a toolbox of code is a sign of a seasoned developer---not just a programmer.";
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
        ),
        // margin: EdgeInsets.fromLTRB(
        //   _screenSize.width * (_smallScreen ? 0.05 : 0.05),
        //   _screenSize.height * (_smallScreen ? 0.05 : 0.2),
        //   _screenSize.width *
        //       (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.05),
        //   _screenSize.height *
        //       (_smallScreen ? (_landscape ? 0.05 : 0.05) : 0.1),
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
//       padding: EdgeInsets.all(_smallScreen ? 10 : 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Programming Paradox',
              style: TextStyle(fontSize: _smallScreen ? 24 : 48),
            ),
            SizedBox(height: _screenSize.height * 0.05),
            // If not set to the 'read more' feature
            if (parentWidget != null && !parentWidget!.readMore!)
              AutoSizeText(
                text,
                style: textStyle,
              ),
            // If no 'widget' or set to 'read more' feature.
            if (parentWidget == null || parentWidget!.readMore!)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textStyle,
                      text: text.substring(0, 560),
                    ),
                    TextSpan(
                      style: textStyle!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      text: ' ...read more',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppRouterDelegate.nextRoute('/paradox');
                        },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
