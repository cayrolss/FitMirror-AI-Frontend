// lib/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importa tus providers de autenticación
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';
import 'package:fitmirror_ai/features/auth/presentation/screens/login_screen.dart';
import 'package:fitmirror_ai/features/auth/presentation/screens/register_screen.dart'; // Crearemos esta
// import 'package:fitmirror_ai/features/dashboard/presentation/screens/dashboard_screen.dart'; // Crearás esta para la app principal

// La clave global para GoRouter (útil para la navegación sin BuildContext)
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// Definición del GoRouter Provider
// Usamos Riverpod para gestionar la instancia de GoRouter
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState =
      ref.watch(authStateChangesProvider); // Observa el estado de autenticación

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/', // Ruta inicial por defecto

    // Redirige al usuario según su estado de autenticación
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn =
          authState.value != null; // true si hay un usuario logueado

      // Rutas protegidas (requieren autenticación)
      final bool goingToProtectedRoute = state.matchedLocation == '/' ||
          state.matchedLocation
              .startsWith('/dashboard'); // Ejemplo de ruta protegida

      // Rutas de autenticación (no requieren autenticación)
      final bool goingToAuthRoute =
          state.matchedLocation.startsWith('/login') ||
              state.matchedLocation.startsWith('/register');

      if (!loggedIn && goingToProtectedRoute) {
        // Si no está logueado y va a una ruta protegida, redirige a login
        return '/login';
      } else if (loggedIn && goingToAuthRoute) {
        // Si está logueado y va a una ruta de autenticación, redirige a la principal
        return '/'; // O '/dashboard'
      }

      // No hay redirección si el usuario está en una ruta adecuada para su estado
      return null;
    },

    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // Esta será la pantalla principal de la aplicación cuando el usuario esté logueado
          // Por ahora, solo un placeholder
          return Scaffold(
            appBar: AppBar(title: Text('FitMirror AI - Dashboard')),
            body: Center(
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
      // Puedes añadir más rutas aquí para otras partes de tu aplicación
    ],
  );
});
