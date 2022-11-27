// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ProgrammingParadox extends WebPage {
  ProgrammingParadox({
    Key? key,
    this.readMore,
    super.addFooter,
  }) : super(
          key: key ?? LabeledGlobalKey('ProgrammingParadox'),
          appBar: AppBar(title: const Text('The Programming Paradox')),
        );
  final bool? readMore;

  // Scroll to position
  // static const double offset = 3600;

  @override
  Widget builder(BuildContext context) {
    //
    final _screenSize = context.screenSize;

    final _smallScreen = context.inSmallScreen;

    final textStyle = Theme.of(context).textTheme.bodyText2;

    const String text =
        "A programming language is such a versatile and dynamic means to create computer software. You can literally write the code in more than one way to do the same thing.\n\nHowever, there's a big problem.\n\nA programming language is such a versatile and dynamic means to create computer software. You can literally write the code in more than one way to do the same thing.\n\nIf you hired Michael Crichton and two other novelists to write a story about resurrected dinosaurs running amok on some deserted island, you'd get three different novels. The same goes for three separate programs written in the same programming language by three separate programmers. Each program may do exactly the same thing, but one can tell each was written by a different programmer!\n\nThat's just the nature of a scriptic language! After all, when texting somebody, you can always write a sentence in more than one way to convey the same meaning---so can you write code in more than one way to accomplish the same task. Computer programming languages were designed that way. They were designed to be the answer to all things---to be adaptive to every industry, to every field, to every situation and to every circumstance. Thus, there's always more than one way to write the code to accomplish the same task. Always! Note, the degree of efficiency may vary, but there you have it.\n\nNow, this great adaptive strength in programming languages reveals one great weakness: We mere mortals are tasked to work with them. Programming languages really do 'separate the wheat from the chaff' when it comes to programmers. Enforcing one standard way of writing the code only hampers its greatest strength, but giving programmers the freedom to create really reveals their degree of skill or lack there of resulting in delays and overruns. For decades, this has been a source of real frustration for those paying for the software. After all, time is money.\n\nNow, many might not believe what I’ve just stated here, but who wants to hire three programmers to write the same program to find out?! Well, just as many do believe it, because they've had to hire yet another programmer to fix the mess left by the first one or two.\n\nIt’s an unnerving fact---particularly for those paying for the software. I mean, who wants to pay three different mechanics to work on their car's engine, right? Of course, when it comes to car engines, three different mechanics can hardly work on it in three different ways---parts usually only fit together in one way. However, many who do the paying think programming is like building a car engine: Just put the pieces together! No, it's like writing a novel, and novels vary in quality.\n\nPut another way, programming languages allow you to write magnificent code and programming languages allow you to write horrible code to perform the same thing! The software industry doesn't want you to know this, but computer programming is very complicated and very time-consuming.\n\nUnless, of course, you’ve kept together pieces of code from past projects so to complete the next project that much faster. Tested, reliable code collected in a toolbox of code is a sign of a seasoned developer---not just a programmer.";
    final _readMore = readMore ?? false;

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
          _screenSize.width * 0.05,
          _screenSize.height * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Programming Paradox',
              style: TextStyle(fontSize: _smallScreen ? 24 : 48),
            ),
            SizedBox(height: _screenSize.height * 0.05),
            // If not set to the 'read more' feature
            if (!_readMore)
              AutoSizeText(
                text,
                style: textStyle,
              ),
            // If no 'widget' or set to 'read more' feature.
            if (_readMore)
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
                          AppRouterDelegate.newRoute('/paradox');
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
