import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p5_home_pages/other/fit_mirror_ai_logo/fit_mirror_ai_logo_widget.dart';
import '/p5_home_pages/other/sign_up_log_in/sign_up_log_in_widget.dart';
import 'dart:ui';
import 'auth1_sign_up_widget.dart' show Auth1SignUpWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth1SignUpModel extends FlutterFlowModel<Auth1SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FitMirrorAiLogo component.
  late FitMirrorAiLogoModel fitMirrorAiLogoModel;
  // Model for SignUp_LogIn component.
  late SignUpLogInModel signUpLogInModel;

  @override
  void initState(BuildContext context) {
    fitMirrorAiLogoModel = createModel(context, () => FitMirrorAiLogoModel());
    signUpLogInModel = createModel(context, () => SignUpLogInModel());
  }

  @override
  void dispose() {
    fitMirrorAiLogoModel.dispose();
    signUpLogInModel.dispose();
  }
}
