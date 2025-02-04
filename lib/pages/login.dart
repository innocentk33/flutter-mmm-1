import 'package:flutter/material.dart';
import 'package:flutter_mmm/pages/home.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController usController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? forceErrorText;
  bool isLoading = false;

  @override
  void dispose() {
    usController.dispose();
    pwController.dispose();
    super.dispose();
  }

  void onChanged(String value) {
    if (forceErrorText != null) {
      setState(() {
        forceErrorText = null;
      });
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length != value.replaceAll(' ', '').length) {
      return 'Username must not contain any spaces';
    }
    if (int.tryParse(value[0]) != null) {
      return 'Username must not start with a number';
    }
    if (value.length <= 2) {
      return 'Username should be at least 3 characters long';
    }
    return null;
  }

  Future<void> onSave() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    setState(() => isLoading = true);


    if (context.mounted) {
       Future.delayed(Duration(seconds: 2), () {
        setState(() => isLoading = false);
        context.goNamed("home");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usController,
                validator: validator,
                onChanged: onChanged,
                forceErrorText: forceErrorText,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'username',
                ),
              ),
              const Gap(10),
              TextFormField(
                controller: pwController,
                validator: validator,
                onChanged: onChanged,
                forceErrorText: forceErrorText,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'password',
                ),
              ),
              const Gap(10),
              if (isLoading)
                const CircularProgressIndicator()
              else
                FilledButton(
                  onPressed: onSave,
                  child: const Text("Login")
                )
            ],
          ),
        )
      )
    );
  }
}