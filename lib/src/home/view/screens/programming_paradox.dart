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
  static const double offset = 4200;

  @override
  // TODO: implement title
  String get title => 'The Programming Paradox';

  @override
  List<Widget>? children04(BuildContext context) => [
        Container(
          margin: const EdgeInsets.fromLTRB(300, 50, 300, 150),
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
            three separate programs, each in three different ways using the same language, 
            and yet all three will essentially do the same thing. 
            
            If you had hired Michael Crichton and two other novelists to write a story
            about resurrected dinosaurs running amok on some deserted island, 
            you'd get three different novels. The same goes for three separate
            programs written by three separate programmers. Each program may do 
            exactly the same thing, but each can be programmed completely different
            --- and yet all three are written in the very same programming language! 
            
            This was by design. Computer programming languages are to be the answer
            to all things, you see. They're to be applied to every industry, to ever field,
            to any situation, and adaptive to every circumstance. Thus, there's
            almost always more than one way to essentially do the same thing. 
            They're very diversified tools! However, that strength reveals a weakness. 
            It's left to we mortals to then apply such capability in a uniform and 
            effective fashion. It's helps us use it, but we're not up to the task.
            
            Picking one standard approach would hamper its greatest strength, 
            but allowing any approach can make for learning curves and overruns. 
            After all, time is money to those who are paying for computer programs.
            Of course, there are those who don't believe in all this, but are not 
            willing to find out. I mean, who wants to hire three programmers to 
            write the same program?! Ironically, many do just that in a way when they
            have to hire another programmer to fix the mess left by the first 
            programmer(s). 
            
            I mean, do you want three different mechanics, to work on
            your car's engine in three different ways?? Maybe different in the 
            degree of efficiency, but not in application. Anyway, that's pretty much
            impossible when it comes to car engines---pieces only fit in a certain way.
            That's not the case for the scriptic tool that is a computer programming
            language. True, the degree of efficiency may vary with every application,
            but the fact remains: there's usually more than one way to put pieces
            together!
            
            Put another way, programming languages allow you to write magnificent
            code and programming languages allow you to write horrible code to 
            perform the exact same thing! Programming is complicated and 
            time-consuming. It's best you know this right now!
            ''',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        )
      ];
}
