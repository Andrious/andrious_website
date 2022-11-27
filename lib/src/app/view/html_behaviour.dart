// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:andrious/src/view.dart';

class HTMLinkWell extends StatefulWidget {
  const HTMLinkWell({required this.child, Key? key}) : super(key: key);
  final InkWell child;
  @override
  State createState() => _HTMLinkWellState();
}

class _HTMLinkWellState extends State<HTMLinkWell> {
  var _isHovering = false;
  late InkWell inkWell;
  String? text;
  @override
  void initState() {
    super.initState();
    inkWell = widget.child;
    if (inkWell.child is Text) {
      text = (inkWell.child as Text).data;
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: inkWell.onTap,
        onDoubleTap: inkWell.onDoubleTap,
        onLongPress: inkWell.onLongPress,
        onTapDown: inkWell.onTapDown,
        onTapCancel: inkWell.onTapCancel,
        onHighlightChanged: inkWell.onHighlightChanged,
        onHover: inkWell.onHover ??
            (value) {
              setState(() {
                _isHovering = value;
              });
            },
        mouseCursor: inkWell.mouseCursor,
        focusColor: inkWell.focusColor,
        hoverColor: inkWell.hoverColor,
        highlightColor: inkWell.highlightColor,
        overlayColor: inkWell.overlayColor,
        splashColor: inkWell.splashColor,
        splashFactory: inkWell.splashFactory,
        radius: inkWell.radius,
        borderRadius: inkWell.borderRadius,
        customBorder: inkWell.customBorder,
        enableFeedback: inkWell.enableFeedback,
        excludeFromSemantics: inkWell.excludeFromSemantics,
        focusNode: inkWell.focusNode,
        canRequestFocus: inkWell.canRequestFocus,
        onFocusChange: inkWell.onFocusChange,
        autofocus: inkWell.autofocus,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text ?? '',
              style: TextStyle(
                color: _isHovering ? Colors.blue[100] : Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            // For showing an underline on hover
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: _isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
}

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final html.Element? appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return this;
    if (appContainer == null) {
      return this;
    }
    return MouseRegion(
      // When the mouse enters the widget set the cursor to pointer
      onHover: (event) {
        appContainer?.style.cursor = 'pointer';
      },
      // When it exits set it back to default
      onExit: (event) {
        appContainer?.style.cursor = 'default';
      },
      child: this,
    );
  }
}
