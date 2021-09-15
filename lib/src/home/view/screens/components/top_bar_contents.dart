import 'package:andrious/src/view.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents(this.opacity, {Key? key}) : super(key: key);

  final double opacity;

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(_screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              // Text(
              //   'EXPLORE',
              //   style: TextStyle(
              //     color: Colors.blueGrey[100],
              //     fontSize: 20,
              //     fontFamily: 'Montserrat',
              //     fontWeight: FontWeight.w400,
              //     letterSpacing: 3,
              //   ),
              // ),
//              Expanded(
//                 child: Row(
// //                  mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(width: screenSize.width / 8),
//                     InkWell(
//                       onHover: (value) {
//                         setState(() {
//                           value
//                               ? _isHovering[0] = true
//                               : _isHovering[0] = false;
//                         });
//                       },
//                       onTap: () {},
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Discover',
//                             style: TextStyle(
//                               color: _isHovering[0]
//                                   ? Colors.blue[200]
//                                   : Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Visibility(
//                             maintainAnimation: true,
//                             maintainState: true,
//                             maintainSize: true,
//                             visible: _isHovering[0],
//                             child: Container(
//                               height: 2,
//                               width: 20,
//                               color: Colors.white,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: screenSize.width / 20),
//                     InkWell(
//                       onHover: (value) {
//                         setState(() {
//                           value
//                               ? _isHovering[1] = true
//                               : _isHovering[1] = false;
//                         });
//                       },
//                       onTap: () {},
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Contact Us',
//                             style: TextStyle(
//                               color: _isHovering[1]
//                                   ? Colors.blue[200]
//                                   : Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Visibility(
//                             maintainAnimation: true,
//                             maintainState: true,
//                             maintainSize: true,
//                             visible: _isHovering[1],
//                             child: Container(
//                               height: 2,
//                               width: 20,
//                               color: Colors.white,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//              ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.white,
                onPressed: AppTheme.toggleMode,
                // onPressed: () {
                //   EasyDynamicTheme.of(context).changeTheme();
                // },
              ),
              // SizedBox(
              //   width: screenSize.width / 50,
              // ),
              // InkWell(
              //   onHover: (value) {
              //     setState(() {
              //       value ? _isHovering[3] = true : _isHovering[3] = false;
              //     });
              //   },
              //   onTap: userEmail == null
              //       ? () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => const AuthDialog(),
              //           );
              //         }
              //       : null,
              //   child: userEmail == null
              //       ? Text(
              //           'Sign in',
              //           style: TextStyle(
              //             color: _isHovering[3] ? Colors.white : Colors.white70,
              //           ),
              //         )
              //       : Row(
              //           children: [
              //             CircleAvatar(
              //               radius: 15,
              //               backgroundImage: imageUrl != null
              //                   ? NetworkImage(imageUrl!)
              //                   : null,
              //               child: imageUrl == null
              //                   ? const Icon(
              //                       Icons.account_circle,
              //                       size: 30,
              //                     )
              //                   : Container(),
              //             ),
              //             const SizedBox(width: 5),
              //             Text(
              //               name ?? userEmail!,
              //               style: TextStyle(
              //                 color: _isHovering[3]
              //                     ? Colors.white
              //                     : Colors.white70,
              //               ),
              //             ),
              //             const SizedBox(width: 10),
              //             TextButton(
              //               style: TextButton.styleFrom(
              //                 primary: Colors.blueGrey,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //               ),
              //               onPressed: _isProcessing
              //                   ? null
              //                   : () async {
              //                       setState(() {
              //                         _isProcessing = true;
              //                       });
              //                       await signOut().then((result) {
              //                         print(result);
              //                         Navigator.of(context).pushReplacement(
              //                           MaterialPageRoute<void>(
              //                             fullscreenDialog: true,
              //                             builder: (context) =>
              //                                 const HomePage(),
              //                           ),
              //                         );
              //                       }).catchError((Object error) {
              //                         print('Sign Out Error: $error');
              //                       });
              //                       setState(() {
              //                         _isProcessing = false;
              //                       });
              //                     },
              //               child: Padding(
              //                 padding: const EdgeInsets.only(
              //                   top: 8,
              //                   bottom: 8,
              //                 ),
              //                 child: _isProcessing
              //                     ? const CircularProgressIndicator()
              //                     : const Text(
              //                         'Sign out',
              //                         style: TextStyle(
              //                           fontSize: 14,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //               ),
              //             )
              //           ],
              //         ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
