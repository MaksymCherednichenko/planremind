import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/plant_first_enter_plants/plant_first_enter_plants_widget.dart';
import '/walkthrough/plants_first_enter_planer/plants_first_enter_planer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final button03hk0vdz = GlobalKey();
final button1jfae093 = GlobalKey();

/// Plants First Enter
///
/// FirstPlantsEnter
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: button03hk0vdz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PlantFirstEnterPlantsWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: button1jfae093,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PlantsFirstEnterPlanerWidget(),
          ),
        ],
      ),
    ];
