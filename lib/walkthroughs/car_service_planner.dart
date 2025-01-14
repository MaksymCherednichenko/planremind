import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/car_first_enter/car_first_enter_widget.dart';
import '/walkthrough/car_first_enter_history/car_first_enter_history_widget.dart';
import '/walkthrough/car_first_enter_planner/car_first_enter_planner_widget.dart';
import '/walkthrough/car_first_enter_car/car_first_enter_car_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerV52724pg = GlobalKey();
final buttonOaxe4n2f = GlobalKey();
final buttonGpcv8pvz = GlobalKey();
final button3z2wl8y0 = GlobalKey();

/// Car Service Planner
///
/// Guide for car service first enter
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// step1
      TargetFocus(
        keyTarget: containerV52724pg,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => CarFirstEnterWidget(),
          ),
        ],
      ),

      /// step2
      TargetFocus(
        keyTarget: buttonOaxe4n2f,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => CarFirstEnterHistoryWidget(),
          ),
        ],
      ),

      /// step3
      TargetFocus(
        keyTarget: buttonGpcv8pvz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => CarFirstEnterPlannerWidget(),
          ),
        ],
      ),

      /// step4
      TargetFocus(
        keyTarget: button3z2wl8y0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => CarFirstEnterCarWidget(),
          ),
        ],
      ),
    ];
