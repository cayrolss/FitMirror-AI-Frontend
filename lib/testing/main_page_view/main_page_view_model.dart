import '/backend/api_requests/api_calls.dart';
import '/components/dark_light_switch_large_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p_z_components/input_field_age/input_field_age_widget.dart';
import '/p_z_components/input_field_goal_weight/input_field_goal_weight_widget.dart';
import '/p_z_components/input_field_weight/input_field_weight_widget.dart';
import '/p_z_components/input_speed/input_speed_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'main_page_view_widget.dart' show MainPageViewWidget;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainPageViewModel extends FlutterFlowModel<MainPageViewWidget> {
  ///  Local state fields for this page.

  int? selectedHeight;

  bool ageSet = false;

  bool heightSet = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUserProfile)] action in mainPageView widget.
  ApiCallResponse? apiResultrcx;
  // State field(s) for questionnairePageView widget.
  PageController? questionnairePageViewController;

  int get questionnairePageViewCurrentIndex =>
      questionnairePageViewController != null &&
              questionnairePageViewController!.hasClients &&
              questionnairePageViewController!.page != null
          ? questionnairePageViewController!.page!.round()
          : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
