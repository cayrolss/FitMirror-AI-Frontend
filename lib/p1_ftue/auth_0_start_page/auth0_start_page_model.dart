import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p5_home_pages/other/fit_mirror_ai_logo/fit_mirror_ai_logo_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'auth0_start_page_widget.dart' show Auth0StartPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth0StartPageModel extends FlutterFlowModel<Auth0StartPageWidget> {
  ///  Local state fields for this page.

  bool showLoginPanel = false;

  ///  State fields for stateful widgets in this page.

  // Model for FitMirrorAiLogo component.
  late FitMirrorAiLogoModel fitMirrorAiLogoModel;

  @override
  void initState(BuildContext context) {
    fitMirrorAiLogoModel = createModel(context, () => FitMirrorAiLogoModel());
  }

  @override
  void dispose() {
    fitMirrorAiLogoModel.dispose();
  }
}
