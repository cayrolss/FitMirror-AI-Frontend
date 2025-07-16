import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'input_field_weight_widget.dart' show InputFieldWeightWidget;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputFieldWeightModel extends FlutterFlowModel<InputFieldWeightWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a valid weight (30–300 kg)';
    }

    if (val.length < 2) {
      return 'Enter a valid weight (30–300 kg)';
    }

    if (!RegExp('^(3[0-9]|[4-9][0-9]|1[0-9]{2}|2[0-9]{2}|300)(\\.\\d{1,2})?\$')
        .hasMatch(val)) {
      return 'Enter a valid weight (30–300 kg)';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
