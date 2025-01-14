import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/health_first_enter_descr/health_first_enter_descr_widget.dart';
import '/walkthrough/health_first_enter_history/health_first_enter_history_widget.dart';
import '/walkthrough/health_first_enter_planner/health_first_enter_planner_widget.dart';
import '/walkthrough/health_first_enter_medications/health_first_enter_medications_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerDperatl9 = GlobalKey();
final button064jt0mu = GlobalKey();
final buttonYtmrjgzr = GlobalKey();
final buttonOe0kxieu = GlobalKey();

/// Health First Enter
///
/// First enter to the Health
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerDperatl9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HealthFirstEnterDescrWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: button064jt0mu,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HealthFirstEnterHistoryWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonYtmrjgzr,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HealthFirstEnterPlannerWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: buttonOe0kxieu,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HealthFirstEnterMedicationsWidget(),
          ),
        ],
      ),
    ];
