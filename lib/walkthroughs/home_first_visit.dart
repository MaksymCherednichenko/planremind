import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/home_tabs/home_tabs_widget.dart';
import '/walkthrough/home_shopping/home_shopping_widget.dart';
import '/walkthrough/home_planner_descr/home_planner_descr_widget.dart';
import '/walkthrough/home_at_home_descr/home_at_home_descr_widget.dart';
import '/walkthrough/home_ask_to_add/home_ask_to_add_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final container3p7o7qv6 = GlobalKey();
final buttonEue9zxtz = GlobalKey();
final buttonBnnauo5i = GlobalKey();
final buttonItusy0fi = GlobalKey();
final floatingActionButtonD08rlbxl = GlobalKey();

/// HomeFirstVisit
///
/// First user enter to home
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container3p7o7qv6,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeTabsWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: buttonEue9zxtz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeShoppingWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonBnnauo5i,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomePlannerDescrWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: buttonItusy0fi,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeAtHomeDescrWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: floatingActionButtonD08rlbxl,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HomeAskToAddWidget(),
          ),
        ],
      ),
    ];
