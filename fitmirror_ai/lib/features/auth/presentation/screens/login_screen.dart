// lib/features/auth/presentation/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';
// LA LÍNEA DE IMPORTACIÓN DE .G.DART YA DEBERÍA ESTAR ELIMINADA DE AQUÍ

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Clave para validar el formulario

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, intenta iniciar sesión
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Muestra un indicador de carga
      // CAMBIO IMPORTANTE: Eliminamos .notifier aquí
      ref
          .read(authControllerProvider)
          .signIn(email, password); // <-- ¡CAMBIO AQUÍ!
    }
  }

  @override
  Widget build(BuildContext context) {
    // Observa el estado del AuthController para feedback al usuario
    // Usamos .select para observar explícitamente la propiedad 'state' del AuthController
    ref.listen<AsyncValue<void>>(
      authControllerProvider.select((controller) => controller.state),
      (previous, next) {
        next.when(
          data: (data) {
            // No hacemos nada especial aquí, el redirect de GoRouter se encargará
            // de navegar si el login es exitoso.
          },
          loading: () {
            // Podrías mostrar un diálogo de carga, pero el botón ya estará deshabilitado.
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Error al iniciar sesión: ${error.toString()}')),
            );
          },
        );
      },
    );

    // Observa el estado del AuthController para controlar el indicador de carga del botón
    final authControllerState = ref
        .watch(authControllerProvider.select((controller) => controller.state));
    final isLoading = authControllerState is AsyncLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu email';
                    }
                    if (!value.contains('@')) {
                      return 'Introduce un email válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : _signIn, // Deshabilita el botón si está cargando
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Iniciar Sesión'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.go(
                              '/register'); // Navega a la pantalla de registro
                        },
                  child: const Text('¿No tienes cuenta? Regístrate aquí.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
