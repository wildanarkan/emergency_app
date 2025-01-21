import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/pages/login/login_provider.dart';
import 'package:emergency_app/widgets/LoadingDialog.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset('assets/emergency_ambulance.jpg'),
          Row(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Image.asset(
                    'assets/logo_sipongga.png',
                    height: 100,
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SIPONGGA',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    Text(
                      'SISTEM PRENOTIFICATION',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      'REJANG LEBONG-AIRLANGGA',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () => _handleLogin(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum mempunyai akun? "),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.register.name!);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
    if (response.code != 200) {
      showSnackBar(context, response.message);
      return;
    }
    context.pushReplacementNamed(AppRoute.home.name!);
  });
}
