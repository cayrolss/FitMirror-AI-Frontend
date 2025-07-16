import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'nutri_page_view_model.dart';
export 'nutri_page_view_model.dart';

class NutriPageViewWidget extends StatefulWidget {
  const NutriPageViewWidget({super.key});

  static String routeName = 'nutriPageView';
  static String routePath = '/nutriPageView';

  @override
  State<NutriPageViewWidget> createState() => _NutriPageViewWidgetState();
}

class _NutriPageViewWidgetState extends State<NutriPageViewWidget>
    with TickerProviderStateMixin {
  late NutriPageViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutriPageViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPageIndex = 1;
      FFAppState().totalPages = 5;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).greenNutri,
              size: 30.0,
            ),
            onPressed: () async {
              FFAppState().containerColor = Color(4292861919);
              FFAppState().borderColor = Color(13816530);
              FFAppState().borderWidth = 1;
              safeSetState(() {});
              FFAppState().currentPageIndex =
                  FFAppState().currentPageIndex + -1;
              safeSetState(() {});
              await _model.questionnairePageViewController?.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          title: Opacity(
            opacity: 0.8,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: LinearPercentIndicator(
                percent: math.min(
                    FFAppState().currentPageIndex / FFAppState().totalPages,
                    1.0),
                lineHeight: 10.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: FlutterFlowTheme.of(context).greenNutri,
                backgroundColor: FlutterFlowTheme.of(context).iconFillerNutri,
                barRadius: Radius.circular(5.0),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  (int currentPage, int totalPages) {
                    return currentPage.toString() + '/' + totalPages.toString();
                  }(FFAppState().currentPageIndex, FFAppState().totalPages),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).charcoal,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _model.questionnairePageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .iconFillerNutri,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.warning_rounded,
                                color: FlutterFlowTheme.of(context).greenNutri,
                                size: 34.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Allergies',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).charcoal,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowCheckboxGroup(
                            options: [
                              'Gluten ',
                              'Lactose',
                              'Nuts',
                              'Eggs',
                              'Fish',
                              'Shellfish',
                              'Soy',
                              'Other...'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.checkboxGroupValues1 = val),
                            controller: _model.checkboxGroupValueController1 ??=
                                FormFieldController<List<String>>(
                              [],
                            ),
                            activeColor:
                                FlutterFlowTheme.of(context).greenNutri,
                            checkColor: Color(0xFFECF1AF),
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).greenNutri,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).charcoal,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            unselectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(4.0),
                            initialized: _model.checkboxGroupValues1 != null,
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().currentPageIndex =
                              FFAppState().currentPageIndex + 1;
                          safeSetState(() {});
                          await _model.questionnairePageViewController
                              ?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 76.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).greenNutri,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 26.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      26.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Next',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Color(0xFFECF1AF),
                                  size: valueOrDefault<double>(
                                    (FFAppState().userAge != 0) &&
                                            (FFAppState().userHeight != 0)
                                        ? 24.0
                                        : 0.0,
                                    24.0,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 30.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .iconFillerNutri,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.thumb_down,
                                color: FlutterFlowTheme.of(context).greenNutri,
                                size: 34.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 12.0, 14.0, 12.0),
                              child: Text(
                                'Disliked Foods',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).charcoal,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowCheckboxGroup(
                            options: [
                              'Vegetables',
                              'Fish',
                              'Meat',
                              'Dairy',
                              'Legumes',
                              'Sweet',
                              'Bitter',
                              'Spicy',
                              'None',
                              'Other...'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.checkboxGroupValues2 = val),
                            controller: _model.checkboxGroupValueController2 ??=
                                FormFieldController<List<String>>(
                              [],
                            ),
                            activeColor:
                                FlutterFlowTheme.of(context).greenNutri,
                            checkColor: Color(0xFFECF1AF),
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).greenNutri,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).charcoal,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            unselectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 1.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(4.0),
                            initialized: _model.checkboxGroupValues2 != null,
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().currentPageIndex =
                              FFAppState().currentPageIndex + 1;
                          safeSetState(() {});
                          await _model.questionnairePageViewController
                              ?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 76.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).greenNutri,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 26.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      26.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Next',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFECF1AF),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Color(0xFF8AE193),
                                  size: valueOrDefault<double>(
                                    (FFAppState().userAge != 0) &&
                                            (FFAppState().userHeight != 0)
                                        ? 24.0
                                        : 0.0,
                                    24.0,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 30.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .iconFillerNutri,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.filter_center_focus_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).greenNutri,
                                  size: 34.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                ' What is your macronutrient focus?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).darkBlue,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userMacronutrientFocus =
                                    'Recommended';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userMacronutrientFocus ==
                                    'Recommended') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userMacronutrientFocus ==
                                            'Recommended'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    FlutterFlowTheme.of(context).greenNutri,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState()
                                                  .userMacronutrientFocus ==
                                              'Recommended'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userMacronutrientFocus ==
                                              'Recommended'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.recommend_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Recommended',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lime,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Best match for you, Optimal mix of protein, carbs and fats',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lime,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userMacronutrientFocus =
                                    'highProtein';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userMacronutrientFocus ==
                                    'highProtein') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userMacronutrientFocus ==
                                            'highProtein'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    FlutterFlowTheme.of(context).greenNutri,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState()
                                                  .userMacronutrientFocus ==
                                              'highProtein'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userMacronutrientFocus ==
                                              'highProtein'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons
                                              .keyboard_double_arrow_up_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'High protein',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'More protein, less carbs and fats',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation2']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userMacronutrientFocus = 'lowFat';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userMacronutrientFocus ==
                                    'lowFat') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation3'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation3']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation3'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation3']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userMacronutrientFocus ==
                                            'lowFat'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    FlutterFlowTheme.of(context).greenNutri,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userMacronutrientFocus ==
                                              'lowFat'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userMacronutrientFocus ==
                                              'lowFat'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons
                                              .keyboard_double_arrow_down_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Low fat',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Fewer fats, higher carbs and moderate protein',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation3']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userMacronutrientFocus = 'lowCarb';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userMacronutrientFocus ==
                                    'lowCarb') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation4'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation4']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation4'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation4']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userMacronutrientFocus ==
                                            'lowCarb'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    FlutterFlowTheme.of(context).greenNutri,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userMacronutrientFocus ==
                                              'lowCarb'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userMacronutrientFocus ==
                                              'lowCarb'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.breadSlice,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Low carb',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Fewer carbs, higher fats and moderate protein',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation4']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userMacronutrientFocus = 'keto';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userMacronutrientFocus ==
                                    'keto') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation5'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation5']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation5'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation5']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userMacronutrientFocus ==
                                            'keto'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userMacronutrientFocus ==
                                              'keto'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userMacronutrientFocus ==
                                              'keto'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.feather,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Keto',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Very low in carbs, high fat and moderate protein',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation5']!,
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .iconFillerNutri,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.local_dining,
                                  color:
                                      FlutterFlowTheme.of(context).greenNutri,
                                  size: 34.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'How many meals per day?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).charcoal,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().mealsPerDay = 2;
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().mealsPerDay == 2) {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation6'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation6']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation6'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation6']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().mealsPerDay == 2
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().mealsPerDay == 2
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().mealsPerDay == 2 ? 4.0 : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.looks_two,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '2 meals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Fewer, bigger meals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation6']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().mealsPerDay = 3;
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().mealsPerDay == 3) {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation7'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation7']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation7'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation7']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().mealsPerDay == 3
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().mealsPerDay == 3
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: FFAppState().mealsPerDay == 3
                                        ? 4.0
                                        : 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.looks_3,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '3 meals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Classic breakfast/lunch/dinner',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation7']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().mealsPerDay = 4;
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().mealsPerDay == 4) {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation8'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation8']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation8'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation8']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().mealsPerDay == 4
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().mealsPerDay == 4
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().mealsPerDay == 4 ? 4.0 : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.looks_4,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '4 meals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Split meals for steady energy',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation8']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().mealsPerDay = 5;
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().mealsPerDay == 5) {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation9'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation9']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation9'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation9']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});
                                await _model.questionnairePageViewController
                                    ?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().mealsPerDay == 5
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().mealsPerDay == 5
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().mealsPerDay == 5 ? 4.0 : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.looks_5,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '5 meals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'small frequent portions',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation9']!,
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .iconFillerNutri,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.tune,
                                  color:
                                      FlutterFlowTheme.of(context).greenNutri,
                                  size: 34.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Which type of diet do you want?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).charcoal,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userDietType = 'standart';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userDietType == 'standart') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation10'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation10']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation10'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation10']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});

                                context.pushNamed(
                                  TermsWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userDietType == 'standart'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : FlutterFlowTheme.of(context)
                                            .greenNutri,
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userDietType == 'standart'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userDietType == 'standart'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.star_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Standart',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lime,
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation10']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userDietType = 'pescatarian';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userDietType ==
                                    'pescatarian') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation11'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation11']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation11'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation11']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});

                                context.pushNamed(
                                  TermsWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userDietType == 'pescatarian'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userDietType == 'pescatarian'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userDietType == 'pescatarian'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.fish,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pescatarian',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation11']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userDietType = 'vegetarian';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userDietType == 'vegetarian') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation12'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation12']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation12'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation12']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});

                                context.pushNamed(
                                  TermsWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userDietType == 'vegetarian'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userDietType == 'vegetarian'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userDietType == 'vegetarian'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.carrot,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Vegetarian',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation12']!,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().userDietType = 'vegan';
                                safeSetState(() {});
                                FFAppState().containerColor =
                                    FlutterFlowTheme.of(context).activeColor;
                                FFAppState().borderColor =
                                    FlutterFlowTheme.of(context)
                                        .activeColorBorder;
                                FFAppState().borderWidth = 4;
                                safeSetState(() {});
                                if (FFAppState().userDietType == 'vegan') {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation13'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation13']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation13'] !=
                                      null) {
                                    await animationsMap[
                                            'containerOnActionTriggerAnimation13']!
                                        .controller
                                        .reverse();
                                  }
                                }
                                FFAppState().currentPageIndex =
                                    FFAppState().currentPageIndex + 1;
                                safeSetState(() {});

                                context.pushNamed(
                                  TermsWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().userDietType == 'vegan'
                                        ? FlutterFlowTheme.of(context)
                                            .activeColor
                                        : Color(0xFF0A4646),
                                    Color(0xFF0A4646),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().userDietType == 'vegan'
                                          ? FlutterFlowTheme.of(context)
                                              .activeColorBorder
                                          : FlutterFlowTheme.of(context)
                                              .normalColorButton,
                                      FlutterFlowTheme.of(context)
                                          .normalColorButton,
                                    ),
                                    width: valueOrDefault<double>(
                                      FFAppState().userDietType == 'vegan'
                                          ? 4.0
                                          : 1.0,
                                      1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(
                                          Icons.eco_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).lime,
                                          size: 40.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Vegan',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFECF1AF),
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation13']!,
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
