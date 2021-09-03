import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-world-html',
      (int viewId) => IFrameElement()
        ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
        ..width = '640'
        ..height = '360'
        ..style.border = 'none');

  runApp(const Directionality(
    textDirection: TextDirection.ltr,
    child: SizedBox(
      width: 640,
      height: 360,
      child: HtmlElementView(viewType: 'hello-world-html'),
    ),
  ));
}
