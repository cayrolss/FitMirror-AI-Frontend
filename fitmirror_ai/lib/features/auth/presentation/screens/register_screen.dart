import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Clave para validar el formulario

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, intenta registrar al usuario
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // CAMBIO 1: Llama al método signUp directamente en la instancia del controlador
      // ref.read(authControllerProvider.notifier) es incorrecto si es AutoDisposeProvider<AuthController>
      ref
          .read(authControllerProvider)
          .signUp(email, password, name); // <-- ¡CAMBIO AQUÍ!
    }
  }

  @override
  Widget build(BuildContext context) {
    // CAMBIO 2 y 3: Observa el estado del AuthController para feedback al usuario
    // Usamos .select para observar explícitamente la propiedad 'state' del AuthController
    ref.listen<AsyncValue<void>>(
      authControllerProvider
          .select((controller) => controller.state), // <-- ¡CAMBIO AQUÍ!
      (previous, next) {
        next.when(
          data: (data) {
            // No hacemos nada especial aquí, el redirect de GoRouter se encargará
            // de navegar si el registro es exitoso.
          },
          loading: () {
            // Podrías mostrar un diálogo de carga.
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Error al registrarse: ${error.toString()}')),
            );
          },
        );
      },
    );

    // CAMBIO 4: Observa el estado del AuthController para controlar el indicador de carga del botón
    final authControllerState = ref.watch(authControllerProvider
        .select((controller) => controller.state)); // <-- ¡CAMBIO AQUÍ!
    final isLoading = authControllerState is AsyncLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
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
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Completo',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
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
                      : _signUp, // Deshabilita el botón si está cargando
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Registrarse'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.go(
                              '/login'); // Navega a la pantalla de inicio de sesión
                        },
                  child: const Text('¿Ya tienes cuenta? Inicia sesión aquí.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
