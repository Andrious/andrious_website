// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Flutter framework

export 'package:flutter/material.dart';

/// MVC framework
export 'package:mvc_application/view.dart' hide AppMenu, runApp;

/// SetState routine
export 'package:state_set/state_set.dart';

/// Google Fonts
export 'package:google_fonts/google_fonts.dart';

/// App level code
export 'package:andrious/src/app/view/html_behaviour.dart';

/// Utility pages - app level
export 'package:andrious/src/app/view/utils/authentication.dart';
export 'package:andrious/src/app/view/utils/theme_data.dart';

/// Utility pages - home level
export 'package:andrious/src/home/view/utils/responsive.dart';
export 'package:andrious/src/home/view/utils/bottom_bar_column.dart';
export 'package:andrious/src/home/view/utils/info_text.dart';
export 'package:andrious/src/home/view/components/bottom_bar.dart';

/// Webpages
export 'package:andrious/src/home/view/pages/main_page.dart';
export 'package:andrious/src/home/view/pages/use_case.dart';

export 'package:andrious/src/home/view/screens/home_page.dart';
export 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
export 'package:andrious/src/home/view/utils/web_scrollbar.dart';
export 'package:andrious/src/home/view/carousel.dart';
export 'package:andrious/src/home/view/destination_heading.dart';
export 'package:andrious/src/home/view/components/explore_drawer.dart';
export 'package:andrious/src/home/view/featured_heading.dart';
export 'package:andrious/src/home/view/featured_tiles.dart';
export 'package:andrious/src/home/view/components/floating_quick_access_bar.dart';
export 'package:andrious/src/home/view/components/top_bar_contents.dart';
