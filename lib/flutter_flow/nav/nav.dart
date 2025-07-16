import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';
import 'package:cupertino_time_picker_hiuzb7/index.dart'
    as $cupertino_time_picker_hiuzb7;
import 'package:custom_calender_library_p0divp/index.dart'
    as $custom_calender_library_p0divp;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $cupertino_time_picker_hiuzb7.initializeRoutes(
    homePageWidgetName: 'cupertino_time_picker_hiuzb7.HomePage',
    homePageWidgetPath: '/homePage',
  );

  $custom_calender_library_p0divp.initializeRoutes(
    homePageWidgetName: 'custom_calender_library_p0divp.HomePage',
    homePageWidgetPath: '/homePage_custom-calender-library-p0divp',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? NavBarPage() : MainPageViewWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? NavBarPage() : MainPageViewWidget(),
      ),
      FFRoute(
        name: HomePageAnalysisWidget.routeName,
        path: HomePageAnalysisWidget.routePath,
        builder: (context, params) => HomePageAnalysisWidget(),
      ),
      FFRoute(
        name: AnalysisResultsPageWidget.routeName,
        path: AnalysisResultsPageWidget.routePath,
        builder: (context, params) => AnalysisResultsPageWidget(
          recommendation: params.getParam(
            'recommendation',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: Auth1SignUpWidget.routeName,
        path: Auth1SignUpWidget.routePath,
        builder: (context, params) => Auth1SignUpWidget(),
      ),
      FFRoute(
        name: HomePageNutritionWidget.routeName,
        path: HomePageNutritionWidget.routePath,
        builder: (context, params) => params.isEmpty
            ? NavBarPage(initialPage: 'HomePageNutrition')
            : HomePageNutritionWidget(),
      ),
      FFRoute(
        name: HomePageProfileWidget.routeName,
        path: HomePageProfileWidget.routePath,
        builder: (context, params) => params.isEmpty
            ? NavBarPage(initialPage: 'HomePageProfile')
            : HomePageProfileWidget(),
      ),
      FFRoute(
        name: QuestionZoneWidget.routeName,
        path: QuestionZoneWidget.routePath,
        builder: (context, params) => QuestionZoneWidget(),
      ),
      FFRoute(
        name: FitnessPlanManageWidget.routeName,
        path: FitnessPlanManageWidget.routePath,
        builder: (context, params) => FitnessPlanManageWidget(),
      ),
      FFRoute(
        name: SettingsPageWidget.routeName,
        path: SettingsPageWidget.routePath,
        builder: (context, params) => SettingsPageWidget(),
      ),
      FFRoute(
        name: QuestionCardioWidget.routeName,
        path: QuestionCardioWidget.routePath,
        builder: (context, params) => QuestionCardioWidget(),
      ),
      FFRoute(
        name: QuestionWeekWidget.routeName,
        path: QuestionWeekWidget.routePath,
        builder: (context, params) => QuestionWeekWidget(),
      ),
      FFRoute(
        name: QuestionWhereWidget.routeName,
        path: QuestionWhereWidget.routePath,
        builder: (context, params) => QuestionWhereWidget(),
      ),
      FFRoute(
        name: QuestionSelectEquipmentWidget.routeName,
        path: QuestionSelectEquipmentWidget.routePath,
        builder: (context, params) => QuestionSelectEquipmentWidget(),
      ),
      FFRoute(
        name: QuestionDietWidget.routeName,
        path: QuestionDietWidget.routePath,
        builder: (context, params) => QuestionDietWidget(),
      ),
      FFRoute(
        name: QuestionAllergiesWidget.routeName,
        path: QuestionAllergiesWidget.routePath,
        builder: (context, params) => QuestionAllergiesWidget(),
      ),
      FFRoute(
        name: QuestionPreferencesWidget.routeName,
        path: QuestionPreferencesWidget.routePath,
        builder: (context, params) => QuestionPreferencesWidget(),
      ),
      FFRoute(
        name: NutriChatPageWidget.routeName,
        path: NutriChatPageWidget.routePath,
        builder: (context, params) => NutriChatPageWidget(),
      ),
      FFRoute(
        name: SelectDumbellsWidget.routeName,
        path: SelectDumbellsWidget.routePath,
        builder: (context, params) => SelectDumbellsWidget(),
      ),
      FFRoute(
        name: Auth0StartPageWidget.routeName,
        path: Auth0StartPageWidget.routePath,
        builder: (context, params) => Auth0StartPageWidget(),
      ),
      FFRoute(
        name: InitialquestPMainLETSBUILDWidget.routeName,
        path: InitialquestPMainLETSBUILDWidget.routePath,
        builder: (context, params) => InitialquestPMainLETSBUILDWidget(),
      ),
      FFRoute(
        name: QuestionPreferenceWidget.routeName,
        path: QuestionPreferenceWidget.routePath,
        builder: (context, params) => QuestionPreferenceWidget(),
      ),
      FFRoute(
        name: QuestionMealsDayWidget.routeName,
        path: QuestionMealsDayWidget.routePath,
        builder: (context, params) => QuestionMealsDayWidget(),
      ),
      FFRoute(
        name: RecipeTemplateWidget.routeName,
        path: RecipeTemplateWidget.routePath,
        builder: (context, params) => RecipeTemplateWidget(),
      ),
      FFRoute(
        name: HomePageTrainingWidget.routeName,
        path: HomePageTrainingWidget.routePath,
        builder: (context, params) => params.isEmpty
            ? NavBarPage(initialPage: 'HomePageTraining')
            : HomePageTrainingWidget(),
      ),
      FFRoute(
        name: DetailsExerciseWidget.routeName,
        path: DetailsExerciseWidget.routePath,
        builder: (context, params) => DetailsExerciseWidget(),
      ),
      FFRoute(
        name: ExercisesDatabaseWidget.routeName,
        path: ExercisesDatabaseWidget.routePath,
        builder: (context, params) => ExercisesDatabaseWidget(),
      ),
      FFRoute(
        name: MainPageViewWidget.routeName,
        path: MainPageViewWidget.routePath,
        builder: (context, params) => MainPageViewWidget(),
      ),
      FFRoute(
        name: GymPageViewWidget.routeName,
        path: GymPageViewWidget.routePath,
        builder: (context, params) => GymPageViewWidget(),
      ),
      FFRoute(
        name: NutriPageViewWidget.routeName,
        path: NutriPageViewWidget.routePath,
        builder: (context, params) => NutriPageViewWidget(),
      ),
      FFRoute(
        name: HomePageProgressWidget.routeName,
        path: HomePageProgressWidget.routePath,
        builder: (context, params) => params.isEmpty
            ? NavBarPage(initialPage: 'HomePageProgress')
            : HomePageProgressWidget(),
      ),
      FFRoute(
        name: ScanWelcomeWidget.routeName,
        path: ScanWelcomeWidget.routePath,
        builder: (context, params) => ScanWelcomeWidget(),
      ),
      FFRoute(
        name: ProfileUserPersonalizationWidget.routeName,
        path: ProfileUserPersonalizationWidget.routePath,
        builder: (context, params) => ProfileUserPersonalizationWidget(),
      ),
      FFRoute(
        name: ProfileNutritionDetailsWidget.routeName,
        path: ProfileNutritionDetailsWidget.routePath,
        builder: (context, params) => ProfileNutritionDetailsWidget(),
      ),
      FFRoute(
        name: ProfileTrainingDetailsWidget.routeName,
        path: ProfileTrainingDetailsWidget.routePath,
        builder: (context, params) => ProfileTrainingDetailsWidget(),
      ),
      FFRoute(
        name: CoachChatPageWidget.routeName,
        path: CoachChatPageWidget.routePath,
        builder: (context, params) => CoachChatPageWidget(),
      ),
      FFRoute(
        name: InitialquestPWorkoutLETSWORKOUTWidget.routeName,
        path: InitialquestPWorkoutLETSWORKOUTWidget.routePath,
        builder: (context, params) => InitialquestPWorkoutLETSWORKOUTWidget(),
      ),
      FFRoute(
        name: InitialquestPNutriLETSNUTRIWidget.routeName,
        path: InitialquestPNutriLETSNUTRIWidget.routePath,
        builder: (context, params) => InitialquestPNutriLETSNUTRIWidget(),
      ),
      FFRoute(
        name: ListWidget.routeName,
        path: ListWidget.routePath,
        builder: (context, params) => ListWidget(),
      ),
      FFRoute(
        name: TermsWidget.routeName,
        path: TermsWidget.routePath,
        builder: (context, params) => TermsWidget(),
      ),
      FFRoute(
        name: InitialquestPMainPersonalTranisitonWidget.routeName,
        path: InitialquestPMainPersonalTranisitonWidget.routePath,
        builder: (context, params) =>
            InitialquestPMainPersonalTranisitonWidget(),
      ),
      FFRoute(
        name: $cupertino_time_picker_hiuzb7.HomePageWidget.routeName,
        path: $cupertino_time_picker_hiuzb7.HomePageWidget.routePath,
        builder: (context, params) =>
            $cupertino_time_picker_hiuzb7.HomePageWidget(),
      ),
      FFRoute(
        name: $custom_calender_library_p0divp.HomePageWidget.routeName,
        path: $custom_calender_library_p0divp.HomePageWidget.routePath,
        builder: (context, params) =>
            $custom_calender_library_p0divp.HomePageWidget(),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/mainPageView';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
