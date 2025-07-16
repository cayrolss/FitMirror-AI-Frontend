import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p5_home_pages/other/fit_mirror_ai_logo/fit_mirror_ai_logo_widget.dart';
import '/p5_home_pages/other/sign_up_log_in/sign_up_log_in_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth1_sign_up_model.dart';
export 'auth1_sign_up_model.dart';

class Auth1SignUpWidget extends StatefulWidget {
  const Auth1SignUpWidget({super.key});

  static String routeName = 'Auth_1_SignUp';
  static String routePath = '/auth1SignUp';

  @override
  State<Auth1SignUpWidget> createState() => _Auth1SignUpWidgetState();
}

class _Auth1SignUpWidgetState extends State<Auth1SignUpWidget> {
  late Auth1SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth1SignUpModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: wrapWithModel(
                      model: _model.fitMirrorAiLogoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FitMirrorAiLogoWidget(),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.signUpLogInModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SignUpLogInWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
