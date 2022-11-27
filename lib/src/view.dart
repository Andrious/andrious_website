// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Utilities
export 'package:url_launcher/url_launcher.dart';

/// MVC framework
export 'package:fluttery_framework/view.dart'
    hide AppMenu, DeviceType; //, runApp;

// /// State Set
// export 'package:state_set/state_set.dart';

/// App level code
export 'package:andrious/src/app/view.dart';
export 'package:auto_size_text/auto_size_text.dart';

/// Device Preview
export 'package:device_preview/device_preview.dart'
    hide basicLocaleListResolution;

/// Try to use this instead of auto size text one day gp
//export 'package:flutter_markdown/flutter_markdown.dart';

/// Google Fonts
export 'package:google_fonts/google_fonts.dart';

/// for TapGestureRecognizer()
export 'package:flutter/gestures.dart';

/// Utility pages - home level
export 'package:andrious/src/home/view/utils/responsive.dart';
//export 'package:andrious/src/home/view/utils/bottom_bar_column.dart';
export 'package:andrious/src/home/view/utils/info_text.dart';
export 'package:andrious/src/home/view/utils/devicepreviw_screen.dart';

//export 'package:andrious/src/home/view/screens/components/bottom_bar.dart';
export 'package:l10n_translator/l10n.dart';

/// Webpage templates
// export 'package:mvc_web/mvc_web.dart'
//     hide DeviceInfo, DeviceType; //device_preview.dart

//export 'package:andrious/src/app/view/screens/template/web_page.dart';
//export 'package:andrious/src/app/view/screens/template/webpage_base.dart';

/// Webpages
export 'package:andrious/main.dart';
export 'package:andrious/src/home/view/pages/main_page.dart';
export 'package:andrious/src/home/view/pages/unknown.dart';

export 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

export 'package:andrious/src/home/view/destination_heading.dart';
export 'package:andrious/src/home/view/featured_heading.dart';
export 'package:andrious/src/home/view/featured_tiles.dart';
//export 'package:andrious/src/home/view/utils/web_scrollbar.dart';

export 'package:andrious/src/home/view/screens/_view_screens.dart';

/// web
export 'package:andrious/src/webapp/utils/web_utils.dart';
