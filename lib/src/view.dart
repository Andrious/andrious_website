// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Flutter framework

/// Utilities
export 'package:url_launcher/url_launcher.dart';

/// MVC framework
export 'package:mvc_application/view.dart' hide AppMenu; //, runApp;

/// State Set
export 'package:state_set/state_set.dart';

/// App level code
export 'package:andrious/src/app/view/html_behaviour.dart';
export 'package:auto_size_text/auto_size_text.dart';

/// Try to use this instead of auto size text one day gp
//export 'package:flutter_markdown/flutter_markdown.dart';

/// Google Fonts
export 'package:google_fonts/google_fonts.dart';

/// Utility pages - app level
export 'package:andrious/src/app/view/utils/authentication.dart';
//export 'package:andrious/src/app/view/utils/basic_widgets.dart';
export 'package:flutter/gestures.dart'; // for TapGestureRecognizer()
//export 'package:andrious/src/app/view/utils/hyperlink.dart';
//export 'package:andrious/src/app/view/utils/iframe_widget.dart';
//export 'package:andrious/src/app/view/screens/template/scaffold_screens.dart';
export 'package:andrious/src/app/view/utils/theme_data.dart';
export 'package:andrious/src/app/view/utils/scrollytell.dart';
//export 'package:andrious/src/app/view/utils/web_utils.dart';

/// Utility pages - home level
export 'package:andrious/src/home/view/utils/responsive.dart';
//export 'package:andrious/src/home/view/utils/bottom_bar_column.dart';
export 'package:andrious/src/home/view/utils/info_text.dart';
//export 'package:andrious/src/home/view/screens/components/bottom_bar.dart';

/// Webpage templates
export 'package:mvc_web/mvc_web.dart';

//export 'package:andrious/src/app/view/screens/template/web_page.dart';
//export 'package:andrious/src/app/view/screens/template/webpage_base.dart';

/// Webpages
export 'package:andrious/main.dart';
export 'package:andrious/src/home/view/pages/main_page.dart';
export 'package:andrious/src/home/view/pages/unknown.dart';

/// Screens
export 'package:andrious/src/home/view/screens/articles_carousel.dart';
export 'package:andrious/src/home/view/screens/articles_grid.dart';
export 'package:andrious/src/home/view/screens/home_page.dart';
export 'package:andrious/src/home/view/screens/home_page_small.dart';
export 'package:andrious/src/home/view/screens/home_screen.dart';
export 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

export 'package:andrious/src/home/view/destination_heading.dart';
export 'package:andrious/src/home/view/featured_heading.dart';
export 'package:andrious/src/home/view/featured_tiles.dart';
//export 'package:andrious/src/home/view/utils/web_scrollbar.dart';

export 'package:andrious/src/home/view/screens/components/explore_drawer.dart';
export 'package:andrious/src/home/view/screens/components/floating_quick_access_bar.dart';
export 'package:andrious/src/home/view/screens/components/top_bar_contents.dart';

/// Specific Screens
export 'package:andrious/src/home/view/screens/dart_packages.dart';
export 'package:andrious/src/home/view/screens/flutter_uis.dart';
export 'package:andrious/src/home/view/screens/home_page.dart';
export 'package:andrious/src/home/view/screens/how_projects_work.dart';
export 'package:andrious/src/home/view/screens/initial_disclosure_agreement.dart';
export 'package:andrious/src/home/view/screens/privacy_policy.dart';
export 'package:andrious/src/home/view/screens/programming_paradox.dart';
export 'package:andrious/src/home/view/screens/use_case.dart';
