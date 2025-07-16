import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interactive_button_double_model.dart';
export 'interactive_button_double_model.dart';

class InteractiveButtonDoubleWidget extends StatefulWidget {
  const InteractiveButtonDoubleWidget({
    super.key,
    String? titleText,
    String? subtitleText,
    required this.icon,
    Color? defaultColor,
    required this.activeColor,
    int? borderWidthDefault,
    int? borderWidthActive,
    this.activeBorderColor,
    required this.doubleToPass,
  })  : this.titleText = titleText ?? 'titleText',
        this.subtitleText = subtitleText ?? 'subtitleText',
        this.defaultColor = defaultColor ?? Colors.white,
        this.borderWidthDefault = borderWidthDefault ?? 1,
        this.borderWidthActive = borderWidthActive ?? 1;

  final String titleText;
  final String subtitleText;
  final Widget? icon;
  final Color defaultColor;
  final Color? activeColor;
  final int borderWidthDefault;
  final int borderWidthActive;
  final Color? activeBorderColor;
  final double? doubleToPass;

  @override
  State<InteractiveButtonDoubleWidget> createState() =>
      _InteractiveButtonDoubleWidgetState();
}

class _InteractiveButtonDoubleWidgetState
    extends State<InteractiveButtonDoubleWidget> with TickerProviderStateMixin {
  late InteractiveButtonDoubleModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractiveButtonDoubleModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: 86.0,
      decoration: BoxDecoration(
        color: FFAppState().containerColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x4F000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FFAppState().borderColor,
          width: FFAppState().borderWidth.toDouble(),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: widget!.icon!,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget!.titleText,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                  Text(
                    widget!.subtitleText,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
