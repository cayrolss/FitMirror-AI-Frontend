// lib/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importa tus providers de autenticación y perfil
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';
import 'package:fitmirror_ai/features/auth/presentation/screens/login_screen.dart';
import 'package:fitmirror_ai/features/auth/presentation/screens/register_screen.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/screens/main_questionnaire_screen.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/screens/gym_questionnaire_screen.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/screens/nutrition_questionnaire_screen.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart'; // Importa la entidad

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  final String? uid = authState.valueOrNull?.uid;

  final AsyncValue<String?> questionnaireStep = uid != null
      ? ref.watch(completeUserProfileStreamProvider(uid).select(
          // Usa uid aquí
          (AsyncValue<CompleteUserProfileEntity?> data) {
            return data.when(
              data: (profile) => AsyncData(profile?.questionnaireStep),
              loading: () => const AsyncLoading(),
              error: (err, stack) => AsyncError(err, stack),
            );
          },
        ))
      : const AsyncData(null);

  final AsyncValue<bool?> onboardingCompletedStatus = uid != null
      ? ref.watch(completeUserProfileStreamProvider(uid).select(
          // Usa uid aquí
          (AsyncValue<CompleteUserProfileEntity?> data) {
            return data.when(
              data: (profile) => AsyncData(profile?.onboardingCompleted),
              loading: () => const AsyncLoading(),
              error: (err, stack) => AsyncError(err, stack),
            );
          },
        ))
      : const AsyncData(false);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = authState.valueOrNull != null;
      final String? currentQuestionnaireStep = questionnaireStep.value;
      final bool onboardingCompleted = onboardingCompletedStatus.value ?? false;

      if (authState.isLoading ||
          questionnaireStep.isLoading ||
          onboardingCompletedStatus.isLoading) {
        return null;
      }

      final bool isAuthRoute =
          state.uri.path == '/login' || state.uri.path == '/register';
      final bool isMainQuestionnaireRoute =
          state.uri.path == '/main-questionnaire';
      final bool isGymQuestionnaireRoute =
          state.uri.path == '/gym-questionnaire';
      final bool isNutritionQuestionnaireRoute =
          state.uri.path == '/nutrition-questionnaire';
      final bool isOnAnyQuestionnaireRoute = isMainQuestionnaireRoute ||
          isGymQuestionnaireRoute ||
          isNutritionQuestionnaireRoute;

      if (!loggedIn && !isAuthRoute) {
        return '/login';
      }

      if (!onboardingCompleted) {
        if (isAuthRoute) {
          if (currentQuestionnaireStep == 'gym') return '/gym-questionnaire';
          if (currentQuestionnaireStep == 'nutrition')
            return '/nutrition-questionnaire';
          return '/main-questionnaire';
        }

        if ((currentQuestionnaireStep == null ||
                currentQuestionnaireStep == 'initial' ||
                currentQuestionnaireStep == 'main') &&
            !isMainQuestionnaireRoute) {
          return '/main-questionnaire';
        }
        if (currentQuestionnaireStep == 'gym' && !isGymQuestionnaireRoute) {
          return '/gym-questionnaire';
        }
        if (currentQuestionnaireStep == 'nutrition' &&
            !isNutritionQuestionnaireRoute) {
          return '/nutrition-questionnaire';
        }
        return null;
      }

      if (onboardingCompleted && (isAuthRoute || isOnAnyQuestionnaireRoute)) {
        return '/';
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Scaffold(
            appBar: AppBar(title: const Text('FitMirror AI - Dashboard')),
            body: const Center(
              child: Text('¡Bienvenido! Estás en el dashboard.'),
            ),
          );
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/main-questionnaire',
        builder: (BuildContext context, GoRouterState state) {
          return const MainQuestionnaireScreen();
        },
      ),
      GoRoute(
        path: '/gym-questionnaire',
        builder: (BuildContext context, GoRouterState state) {
          return const GymQuestionnaireScreen();
        },
      ),
      GoRoute(
        path: '/nutrition-questionnaire',
        builder: (BuildContext context, GoRouterState state) {
          return const NutritionQuestionnaireScreen();
        },
      ),
    ],
  );
});
