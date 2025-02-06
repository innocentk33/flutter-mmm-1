import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mmm/core/extension/context.dart';
import 'package:flutter_mmm/presentation/bloc/login_cubit.dart';
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
      return context.l1On.requiredField;
    }
    if (value.length != value.replaceAll(' ', '').length) {
      return context.l1On.usernameSpace;
    }
    if (int.tryParse(value[0]) != null) {
      return context.l1On.usernameStart;
    }
    if (value.length <= 2) {
      return context.l1On.usernameLength;
    }
    return null;
  }

  void onSave() {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    context.read<LoginCubit>().loginButtonPressed(username: usController.text, password: pwController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l1On.login),
          centerTitle: true,
        ),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.goNamed("home");
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid credentials")));
            }
          },
          child: Form(
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
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: context.l1On.username,
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: pwController,
                      validator: validator,
                      onChanged: onChanged,
                      forceErrorText: forceErrorText,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        hintText: context.l1On.password,
                      ),
                    ),
                    const Gap(10),
                    //if (isLoading)
                    // const CircularProgressIndicator()
                    //else

                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return FilledButton(onPressed: onSave, child: const Text("Login"));
                        }
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
