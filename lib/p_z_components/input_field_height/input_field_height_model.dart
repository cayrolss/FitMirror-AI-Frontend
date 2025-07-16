import '/components/metric_toggle_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'input_field_height_widget.dart' show InputFieldHeightWidget;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputFieldHeightModel extends FlutterFlowModel<InputFieldHeightWidget> {
  ///  Local state fields for this component.

  bool errorText = false;

  int? cmHeightField;

  int? ftHeightField;

  int? inHeightField;

  ///  State fields for stateful widgets in this component.

  // Model for MetricToggle component.
  late MetricToggleModel metricToggleModel;
  // State field(s) for MetersField widget.
  FocusNode? metersFieldFocusNode;
  TextEditingController? metersFieldTextController;
  String? Function(BuildContext, String?)? metersFieldTextControllerValidator;
  // State field(s) for FeetField widget.
  FocusNode? feetFieldFocusNode;
  TextEditingController? feetFieldTextController;
  String? Function(BuildContext, String?)? feetFieldTextControllerValidator;
  // State field(s) for InchesField widget.
  FocusNode? inchesFieldFocusNode;
  TextEditingController? inchesFieldTextController;
  String? Function(BuildContext, String?)? inchesFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    metricToggleModel = createModel(context, () => MetricToggleModel());
  }

  @override
  void dispose() {
    metricToggleModel.dispose();
    metersFieldFocusNode?.dispose();
    metersFieldTextController?.dispose();

    feetFieldFocusNode?.dispose();
    feetFieldTextController?.dispose();

    inchesFieldFocusNode?.dispose();
    inchesFieldTextController?.dispose();
  }
}
