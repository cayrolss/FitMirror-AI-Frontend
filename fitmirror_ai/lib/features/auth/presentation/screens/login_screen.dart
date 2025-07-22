// lib/features/auth/presentation/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';
import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Solo inicialización básica, no listeners de Riverpod
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      // Posponer la configuración del listener hasta después del primer build
      Future.microtask(() => _setupAuthListener());
    }
  }

  void _setupAuthListener() {
    ref.listen<AsyncValue<UserEntity?>>(
      authStateChangesProvider,
      (_, state) {
        state.whenData((user) {
          if (user != null && context.mounted) {
            context.go('/');
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      ref.read(authControllerProvider).signIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Configurar listeners solo en build
    ref.listen<AsyncValue<void>>(
      authControllerProvider.select((controller) => controller.state),
      (previous, next) {
        next.when(
          data: (data) {
            // Redirigir mediante el listener principal
          },
          loading: () {},
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
                  onPressed: isLoading ? null : _signIn,
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
                          context.go('/register');
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
