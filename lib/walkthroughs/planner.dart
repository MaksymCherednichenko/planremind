import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/wellcome_modul/select_language/select_language_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final calendarQ4bvrncx = GlobalKey();
final columnHrvnza0x = GlobalKey();
final buttonZvxw3hp5 = GlobalKey();

/// Planner
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: calendarQ4bvrncx,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => SelectLanguageWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnHrvnza0x,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => SelectLanguageWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonZvxw3hp5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => SelectLanguageWidget(),
          ),
        ],
      ),
    ];
