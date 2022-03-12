// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// hide runApp as it's not compatible with Flutter Web
// Error: Unsupported operation: dart:isolate is not supported on dart4web
export 'package:andrious/src/app/controller/app_controller.dart'
    hide AppController, runApp;
