// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart' hide MyApp;

/// Implement the DevicePreview package for the specified app.
mixin DevicePreviewMixin {
  //
  Widget googlePlay(String image) => InkWell(
        onTap: () async {
          const url = 'https://www.microsoft.com/store/apps/9NCVMK8PLKSP';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Image.asset(image),
      );

  Widget appStore(String image) => InkWell(
        onTap: () async {
          const url = 'https://www.microsoft.com/store/apps/9NCVMK8PLKSP';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Image.asset(image),
      );

  Widget windowsStore(String image) => InkWell(
        onTap: () async {
          const url = 'https://www.microsoft.com/store/apps/9NCVMK8PLKSP';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Image.asset(image),
      );
}
