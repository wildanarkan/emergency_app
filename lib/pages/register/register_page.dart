import 'dart:developer';

import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/pages/register/register_provider.dart';
import 'package:emergency_app/widgets/LoadingDialog.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_dropdown.dart';
import 'package:emergency_app/widgets/build_field.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  String? selectedTeam;

  final List<String> teams = ['TGC Puskemas', 'PSC 119 Kota'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'Register', enableBackButton: true, context: context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildField(
                isRequired: true,
                controller: nameController,
                title: 'Nama Lengkap',
              ),
              const SizedBox(height: 20),
              BuildField(
                isRequired: true,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                title: 'No. HP',
              ),
              const SizedBox(height: 20),
              BuildField(
                isRequired: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                title: 'Email',
              ),
              const SizedBox(height: 20),
              BuildDropdown(
                title: 'Team',
                items: teams,
                selectedItem: selectedTeam,
                isRequired: true,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedTeam = selectedValue ?? '';
                  });
                },
              ),
              const SizedBox(height: 20),
              BuildField(
                isRequired: true,
                controller: passwordController,
                obscureText: _obscureText,
                title: 'Password',
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _handleRegister(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegister(BuildContext context) {
    final name = nameController.text;
    final phone = phoneController.text;
    final email = emailController.text;
    final password = passwordController.text;

    // Validasi field tidak boleh kosong
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        selectedTeam == null ||
        password.isEmpty) {
      showSnackBar(context, 'Semua data wajib diisi!');
      return;
    }

    // Validasi format email menggunakan RegExp
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      showSnackBar(context, 'Format email tidak valid');
      return;
    }

    // Validasi panjang password
    if (password.length < 6) {
      showSnackBar(context, 'Password minimal 6 karakter');
      return;
    }

    LoadingDialog.runWithLoading(context, () {
      return context.read<RegisterProvider>().register(
            name: name,
            phone: phone,
            email: email,
            team: selectedTeam!,
            password: password,
          );
    }).then((response) {
      if (!context.mounted) return;

      if (response.code != 201) {
        log('Name: $name, Phone: $phone, Email: $email, Team: $selectedTeam, Password: $password');
        showSnackBar(context,
            '${response.code.toString()} - ${response.data.toString()}');
        return;
      }

      showSnackBar(context, 'Registrasi berhasil! Silakan login');
      context.goNamed(AppRoute.login.name!);
    });
  }
}
