import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medalert/cubit/auth_cubit.dart'; // Sesuaikan dengan nama project Anda
import 'package:medalert/cubit/auth_state.dart'; // Sesuaikan dengan nama project Anda

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            // Navigate to home page
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hallo!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Masukkan Informasi Akun",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                // Input Email
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Masukkan Email",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Input Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Masukkan Password",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement email/password login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF627C99),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Lupa Password?",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                const SizedBox(height: 24),
                // Social Media Login
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                const Text("Social Media Login"),
                const SizedBox(height: 8),
                // Google Sign In Button
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                        onPressed: () =>
                            context.read<AuthCubit>().signInWithGoogle(),
                        icon: Image.asset(
                          'assets/images/google.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
