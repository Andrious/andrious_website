// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ProgrammingParadox extends WebPage<ProgrammingParadox> {
  ProgrammingParadox({Key? key})
      : super(
          key: key,
          accessBar: false,
        );
  // Scroll to position
  static const double offset = 3600;

  @override
  // TODO: implement title
  String get title => 'The Programming Paradox';

  @override
  List<Widget>? children04(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return [
      Container(
//          margin: const EdgeInsets.fromLTRB(300, 50, 300, 150),
        margin: EdgeInsets.fromLTRB(
          _screenSize.width * 0.15,
          _screenSize.height * 0.2,
          _screenSize.width * 0.15,
          _screenSize.height * 0.2,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'The Programming Paradox',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 18),
            Text(
              '''
            Computer programming languages are amazing if you think about it:
            They're such versatile and multifaceted scriptic tools. You can literally write 
            three separate programs, each in three different ways using the same language, 
            and yet all three will essentially do the same thing.
            
            However, there's a big problem with computer programming languages: 
            They're such versatile and multifaceted scriptic tools. You can literally write 
            three separate programs, each in three different ways using the same 
            programming language and yet all three will essentially do the same thing. 
            
            If you had hired Michael Crichton and two other novelists to write a story
            in English about resurrected dinosaurs running amok on some deserted island, 
            you'd get three different novels. The same goes for three separate programs 
            written in the same programming language by three separate programmers.
            Each program may do exactly the same thing, but each can be programmed 
            differently! 
            
            This was by design. Computer programming languages are to be the answer
            to all things, you see. They're to be applied to every industry, to ever field,
            to any situation, and adaptive to every circumstance. Thus, there's
            almost always more than one way to essentially do the same thing. 
            They're very diversified tools! However, that strength reveals a weakness. 
            It's far too easy for we mere mortals to each then apply their own unique 
            approach to the code it's almost impossible to share a uniform approach
            without compromising efficiency. Programming languages really highlights
            'the wheat from the chaff' when it comes to programmers.
            
            Picking one standard approach would hamper its adaptivity, 
            but allowing any approach can make maintainability a nightmare---
            resulting in learning curves and overruns. Time is money after all 
            for those who are paying for these computer programs.
            
            Now, some will not believe what I'm saying here, and who wants to 
            hire three programmers to write the same program to find out?! 
            Ironically, many find out in the end anyway when they have to hire 
            another programmer to fix the mess left by the first two. 
            
            It is a rather unnerving fact, isn't? I mean, who wants three different 
            mechanics, to work on your car's engine in three different ways?? 
            Pretty much impossible, of course, when it comes to car engines---
            pieces only fit in a certain way. Unfortunately, many think that's the
            case as well when it comes to computer programs. Far from it. Maybe
            different in the degree of efficiency,
            In the case for the scriptic tool that is a computer programming
            language. True, the degree of efficiency may vary with every application,
            but the fact remains: there's usually more than one way to put pieces
            together!
            
            Put another way, programming languages allow you to write magnificent
            code and programming languages allow you to write horrible code to 
            perform essentially the exact same thing! Programming is complicated and 
            time-consuming. It's best you know this right now!
            ''',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )
    ];
  }
}
