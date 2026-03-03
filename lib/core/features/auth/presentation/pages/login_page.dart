import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_apps/core/features/auth/presentation/bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            final data = state.data;
            if (data['require_face_registration'] == true) {
              Navigator.pushNamed(context, '/face-register');
            } else if (data['require_face_scan'] == true) {
              Navigator.pushNamed(context, '/face-scan');
            } else {
              Navigator.pushNamed(context, '/home');
            }
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
                TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password")),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginEvent(
                      emailController.text,
                      passwordController.text,
                    ));
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}