import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'input_field_age_widget.dart' show InputFieldAgeWidget;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputFieldAgeModel extends FlutterFlowModel<InputFieldAgeWidget> {
  ///  Local state fields for this component.

  bool errorText = false;

  int? ageUser;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AgeField widget.
  FocusNode? ageFieldFocusNode;
  TextEditingController? ageFieldTextController;
  String? Function(BuildContext, String?)? ageFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageFieldFocusNode?.dispose();
    ageFieldTextController?.dispose();
  }
}
