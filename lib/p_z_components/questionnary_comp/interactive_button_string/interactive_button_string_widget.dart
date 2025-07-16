import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interactive_button_string_model.dart';
export 'interactive_button_string_model.dart';

class InteractiveButtonStringWidget extends StatefulWidget {
  const InteractiveButtonStringWidget({
    super.key,
    String? titleText,
    String? subtitleText,
    required this.icon,
    Color? defaultColor,
    required this.activeColor,
    int? borderWidthDefault,
    int? borderWidthActive,
    this.activeBorderColor,
    String? strToPass,
    required this.fieldToPass,
  })  : this.titleText = titleText ?? 'titleText',
        this.subtitleText = subtitleText ?? 'subtitleText',
        this.defaultColor = defaultColor ?? Colors.white,
        this.borderWidthDefault = borderWidthDefault ?? 1,
        this.borderWidthActive = borderWidthActive ?? 1,
        this.strToPass = strToPass ?? 'defString';

  final String titleText;
  final String subtitleText;
  final Widget? icon;
  final Color defaultColor;
  final Color? activeColor;
  final int borderWidthDefault;
  final int borderWidthActive;
  final Color? activeBorderColor;
  final String strToPass;
  final String? fieldToPass;

  @override
  State<InteractiveButtonStringWidget> createState() =>
      _InteractiveButtonStringWidgetState();
}

class _InteractiveButtonStringWidgetState
    extends State<InteractiveButtonStringWidget> {
  late InteractiveButtonStringModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractiveButtonStringModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 1.0,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
