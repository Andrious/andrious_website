// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:core';

import 'package:andrious/src/view.dart' hide MyApp;

/// Implement the DevicePreview package for the specified app.
mixin DevicePreviewMixin {
  /// Launch the specified app website on the Google Play Store
  /// Present the appropriate Play Store button
  Widget googlePlay({String? appId, bool? darkMode}) {
    appId ??= '';
    darkMode ??= false;
    final url = 'https://play.google.com/store/apps/details?id=${appId.trim()}';
    return urlTap(
      image:
          'images/logos/${darkMode ? 'googleplay_dark.png' : 'googleplay_light.png'}',
      url: url,
    );
  }

  /// Launch the Apple App Store website for the specified app.
  Widget appStore({String? appId, bool? darkMode}) {
    appId ??= '';
    darkMode ??= false;
    final url = 'https://play.google.com/store/apps/details?id=${appId.trim()}';
    return urlTap(
      image:
          'images/logos/${darkMode ? 'appstore_dark.png' : 'appstore_light.png'}',
      url: url,
    );
  }

  Widget windowsStore({String? appId, bool? darkMode}) {
    appId ??= '';
    darkMode ??= false;
    final url = 'https://www.microsoft.com/store/apps/${appId.trim()}';
    return urlTap(
      image:
          'images/logos/${darkMode ? 'windows_store_dark.png' : 'windows_store_light.png'}',
      url: url,
    );
  }

  Widget urlTap({required String url, required String image}) => InkWell(
        onTap: () async {
          final uri = Uri.tryParse(url);
          // Not null
          var canLaunch = uri != null;
          if (canLaunch) {
            // URL can be handled by the device.
            canLaunch = await canLaunchUrl(uri);
          }
          if (canLaunch) {
            await launchUrl(uri!);
          }
        },
        child: Image.asset(image),
      );
}
