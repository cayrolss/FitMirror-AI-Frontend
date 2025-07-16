import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'gym_page_view_widget.dart' show GymPageViewWidget;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class GymPageViewModel extends FlutterFlowModel<GymPageViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for questionnairePageView widget.
  PageController? questionnairePageViewController;

  int get questionnairePageViewCurrentIndex =>
      questionnairePageViewController != null &&
              questionnairePageViewController!.hasClients &&
              questionnairePageViewController!.page != null
          ? questionnairePageViewController!.page!.round()
          : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
