import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p3_gym/exercises/z_equipment_b_s/z_equipment_b_s_widget.dart';
import '/p3_gym/exercises/z_muscle_groups_b_s/z_muscle_groups_b_s_widget.dart';
import 'dart:ui';
import 'exercises_database_widget.dart' show ExercisesDatabaseWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExercisesDatabaseModel extends FlutterFlowModel<ExercisesDatabaseWidget> {
  ///  Local state fields for this page.

  bool isFavorite = false;

  ///  State fields for stateful widgets in this page.

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
