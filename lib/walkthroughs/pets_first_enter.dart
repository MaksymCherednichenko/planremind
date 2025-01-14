import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/pets_first_enter_planner/pets_first_enter_planner_widget.dart';
import '/walkthrough/pets_first_enter_history/pets_first_enter_history_widget.dart';
import '/walkthrough/pets_first_enter_planner2/pets_first_enter_planner2_widget.dart';
import '/walkthrough/pets_first_enter_pet/pets_first_enter_pet_widget.dart';
import '/walkthrough/pets_first_enter_navigate/pets_first_enter_navigate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerLatpzwf6 = GlobalKey();
final buttonEi584ysv = GlobalKey();
final button3ukkvq3z = GlobalKey();
final buttonF9vzmkqt = GlobalKey();

/// Pets First enter
///
/// First enter to Pets module
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerLatpzwf6,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PetsFirstEnterPlannerWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: buttonEi584ysv,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PetsFirstEnterHistoryWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: button3ukkvq3z,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PetsFirstEnterPlanner2Widget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: buttonF9vzmkqt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PetsFirstEnterPetWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: buttonF9vzmkqt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PetsFirstEnterNavigateWidget(),
          ),
        ],
      ),
    ];
