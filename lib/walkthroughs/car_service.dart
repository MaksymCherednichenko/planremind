import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/wellcome_modul/select_language/select_language_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final calendar4ci85pz4 = GlobalKey();
final buttonG6upywve = GlobalKey();

/// Car service
///
/// Car service ftue Planner guide
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: calendar4ci85pz4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
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
        keyTarget: buttonG6upywve,
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
    ];
