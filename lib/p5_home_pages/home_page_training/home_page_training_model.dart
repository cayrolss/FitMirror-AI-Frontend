import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p_z_components/calendar/calendar_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'home_page_training_widget.dart' show HomePageTrainingWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageTrainingModel extends FlutterFlowModel<HomePageTrainingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for calendar component.
  late CalendarModel calendarModel;

  @override
  void initState(BuildContext context) {
    calendarModel = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    calendarModel.dispose();
  }
}
