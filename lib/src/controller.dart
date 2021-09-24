// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Flutter framework

export 'package:andrious/src/app/controller/app_controller.dart'
    hide AppController, runApp;

/// MVC framework
// hide runApp as it's not compatible with Flutter Web
export 'package:mvc_application/controller.dart' hide AppController, runApp;
