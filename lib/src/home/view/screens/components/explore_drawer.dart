// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

export 'package:andrious/src/home/view/utils/auth_dialog.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Theme.of(context).bottomAppBarColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (userEmail == null)
                  Container(
                    width: double.maxFinite,
                    child: TextButton(
                      // color: Colors.black,
                      // hoverColor: Colors.blueGrey[800],
                      // highlightColor: Colors.blueGrey[700],
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AuthDialog(),
                        );
                      },
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            imageUrl != null ? NetworkImage(imageUrl!) : null,
                        child: imageUrl == null
                            ? const Icon(
                                Icons.account_circle,
                                size: 40,
                              )
                            : Container(),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        name ?? userEmail!,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 20),
                if (userEmail != null)
                  Container(
                    width: double.maxFinite,
                    child: TextButton(
                      // color: Colors.black,
                      // hoverColor: Colors.blueGrey[800],
                      // highlightColor: Colors.blueGrey[700],
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: _isProcessing
                          ? null
                          : () async {
                              setState(() {
                                _isProcessing = true;
                              });
                              await signOut().then((result) {
                                print(result);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                    fullscreenDialog: true,
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }).catchError((Object error) {
                                print('Sign Out Error: $error');
                              });
                              setState(() {
                                _isProcessing = false;
                              });
                            },
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: _isProcessing
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Sign out',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  )
                else
                  Container(),
                if (userEmail != null)
                  const SizedBox(height: 20)
                else
                  Container(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Discover',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Divider(
                    color: Colors.blueGrey[400],
                    thickness: 2,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Copyright © 2020 | EXPLORE',
                      style: TextStyle(
                        color: Colors.blueGrey[300],
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
