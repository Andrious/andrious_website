// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

class ProgrammingParadox extends WebPage {
  const ProgrammingParadox({Key? key}) : super(key: key);

  @override
  // TODO: implement title
  String get title => 'The Programming Paradox';

  @override
  List<Widget>? children04(BuildContext context) {
    final _screenSize = screenSize!;
    return [
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
            There's something amazing about computer programming languages:
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
            exactly the same thing, but each can be programmed completely different. 
            
            This was by design. Computer programming languages are to be the answer
            to all things, you see. They're to be applied to every industry, to ever field,
            to any situation, and be reliable and adaptive to every circumstance. 
            They're very diversified tools! However, that strength reveals a weakness. 
            It's left to we mortals to then apply such capability in a uniform and 
            effective fashion, but in many cases we just can't or shouldn't frankly.
            
            Picking one standard approach would hamper its greatest strength, 
            but allowing any approach can make for learning curves and overruns. 
            After all, time is money to those who are paying for computer programs.
            Of course, there are those who don't believe in all this, but are not 
            willing to find out. I mean, who wants to hire three programmers to 
            write the same program?! Ironically, many do just that in a way when they
            have to hire another programmer to fix the mess left by the first 
            programmer(s).
            
            Again, programming languages allow you to write great code
            or horrible code that performs the exact same thing! Programming is 
            complicated and time-consuming. It's best you know this right now!
            ''',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )
    ];
  }
}
