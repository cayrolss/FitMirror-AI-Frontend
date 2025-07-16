import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_next_model.dart';
export 'button_next_model.dart';

class ButtonNextWidget extends StatefulWidget {
  const ButtonNextWidget({
    super.key,
    String? titleButton,
  }) : this.titleButton = titleButton ?? 'Next';

  final String titleButton;

  @override
  State<ButtonNextWidget> createState() => _ButtonNextWidgetState();
}

class _ButtonNextWidgetState extends State<ButtonNextWidget>
    with TickerProviderStateMixin {
  late ButtonNextModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonNextModel());

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.02),
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
    return Stack(
      children: [
        FFButtonWidget(
          onPressed: () async {
            if (animationsMap['buttonOnActionTriggerAnimation'] != null) {
              await animationsMap['buttonOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
          },
          text: widget!.titleButton,
          options: FFButtonOptions(
            width: double.infinity,
            height: 70.0,
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ).animateOnActionTrigger(
          animationsMap['buttonOnActionTriggerAnimation']!,
        ),
      ],
    );
  }
}
