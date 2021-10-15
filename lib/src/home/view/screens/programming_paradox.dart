// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ProgrammingParadox extends WebPage {
  ProgrammingParadox({Key? key, this.readMore = false})
      : super(
          _ProgrammingParadoxController(),
          key: key,
          accessBar: false,
        );
  final bool? readMore;

  // Scroll to position
  static const double offset = 3600;

  @override
  // TODO: implement title
  String get title => 'The Programming Paradox';
}

class _ProgrammingParadoxController extends WebPageController {
  _ProgrammingParadoxController() : super();

  @override
  void initState() {
    super.initState();
    parentWidget = widget as ProgrammingParadox;
  }

  ProgrammingParadox? parentWidget;

  @override
  List<Widget>? children04(BuildContext context, [WebPage? widget]) {
    //
    final _screenSize = MyApp.screenSize;

    final _smallScreen = MyApp.inSmallScreen;

    final _landscape = MyApp.inLandscape;

    final textStyle = Theme.of(context).textTheme.bodyText2;

    const String text =
        "Computer programming languages are amazing if you think about it:\nThey're such versatile and multifaceted scriptic tools. You can literally write three separate programs, each in three different ways using the same language, and yet all three will essentially do the same thing.\n\nHowever, there's a big problem with computer programming languages:\nThey're such versatile and multifaceted scriptic tools. You can literally write three separate programs, each in three different ways using the same language and yet all three will essentially do the same thing.\n\nIf you had hired Michael Crichton and two other novelists to write a story about resurrected dinosaurs running amok on some deserted island, you'd get three different novels. The same goes for three separate programs written in the same programming language by three separate programmers. Each program may do exactly the same thing, but one can tell each was written by a separate programmer!\n\nThat's just the nature of a scriptic language! You can write a sentence in more than one way to convey the same meaning, can't you? Well, so can you write code more than one way to accomplish the same thing. Computer programming languages are to be the answer to all things, you see. They're to be applied to every industry, to every field, to any situation, and adaptive to every circumstance. Thus, there's almost always more than one way to do a particular thing.\n\nHowever, that strength reveals a weakness. It's far too easy for mere mortals to then apply their own unique approach to the code. However, it's very difficult to sustain a uniform approach without compromising efficiency. Programming languages really do 'separate the wheat from the chaff' when it comes to programmers. Picking one standard approach would hamper its adaptivity, but allowing any approach can make maintainability a nightmare and can result in learning curves and overruns. The latter being particularly undesirable. After all, for those who are paying for these computer programs, time is money.\n\nNow, many might not believe what I'm saying here, but who wants to hire three programmers to write the same program to find out?! Ironically, however, many do find out it's true when they have to hire yet another programmer to fix the mess left by the first two.\n\nIt is a rather unnerving fact, is it not? Particularly for those paying for the computer programs. I mean, who wants to pay three different mechanics to work on your car's engine in three different ways?? Note, that's pretty much impossible, of course, when it comes to car engines. Their pieces usually only fit together in one certain way. Unfortunately, many think building a computer program is like building a car engine--just put the pieces together. No, it's like writing a novel. And like novels, they do vary in quality.\n\nPut another way, programming languages allow you to write magnificent code and programming languages allow you to write horrible code to perform essentially the same thing! Programming is complicated and time-consuming. It's best you know this right now!";

    return [
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            _screenSize.width * (_smallScreen ? 0.1 : 0.05),
            _screenSize.height * (_smallScreen ? 0.1 : 0.2),
            _screenSize.width *
                (_smallScreen ? (_landscape ? 0.1 : 0.1) : 0.05),
            _screenSize.height *
                (_smallScreen ? (_landscape ? 0.1 : 0.1) : 0.2),
          ),
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
                const AutoSizeText(text),
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
      )
    ];
  }
}
