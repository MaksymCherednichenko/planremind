import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/hub_page_first/hub_page_first_widget.dart';
import '/walkthrough/hub_page_swipe/hub_page_swipe_widget.dart';
import '/walkthrough/home_first/home_first_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final gridView7djlhu3o = GlobalKey();
final containerYobbt3fq = GlobalKey();

/// FTUE
///
/// First time user experience in hub
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: gridView7djlhu3o,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HubPageFirstWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: gridView7djlhu3o,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HubPageSwipeWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerYobbt3fq,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HomeFirstWidget(),
          ),
        ],
      ),
    ];
