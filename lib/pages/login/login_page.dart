import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/pages/login/login_provider.dart';
import 'package:emergency_app/widgets/LoadingDialog.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Image.asset('assets/emergency_ambulance.jpg'),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.grey)),
                    onPressed: () => _handleLogin(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _handleLogin({
  required BuildContext context,
  required String email,
  required String password,
}) {
  LoadingDialog.runWithLoading(context, () {
    return context.read<LoginProvider>().login(
          email: email,
          password: password,
        );
  }).then((response) {
    if (!context.mounted) return;
    if (response.data?.accessToken?.isEmpty ?? false) {
      showSnackBar(context, response.message);
      return;
    }
    context.pushReplacementNamed(AppRoute.home.name!);
  });
}
