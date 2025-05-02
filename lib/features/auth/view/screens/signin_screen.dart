import 'package:ahmed_mahmoud_flutter_task/dependency_injection.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/cubits/signin_cubit/signin_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/form_button.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/snack_bar.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/text_form_field.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenScreenState();
}

class _SigninScreenScreenState extends State<SigninScreen> {
  final signinKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SigninCubit>(),
      child: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavBarHome()),
            );
            showCustomSnackBar(context, "Login Successful");
          } else if (state is SigninFailure) {
            showCustomSnackBar(context, state.message);
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SvgPicture.asset(
                'assets/icons/wavesOpacity.svg',
                height: MediaQuery.of(context).size.height / 1.5,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                      child: Form(
                        key: signinKey,
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Text("Sign in"),
                              const SizedBox(height: 30),
                              // Email
                              CustomTextFormField(
                                controller: emailController,
                                hint: "Email",
                                icon: Icons.email_rounded,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter an email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                obsecure: passwordVisible,
                                suffixIcon:
                                    passwordVisible
                                        ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          icon: const Icon(Icons.visibility),
                                        )
                                        : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.visibility_off_outlined,
                                          ),
                                        ),
                                controller: passwordController,
                                hint: "Password",
                                icon: Icons.password_rounded,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a password";
                                  }
                                  if (value.length < 8) {
                                    return "Password must be at least 8 characters long";
                                  }
                                  if (value.length > 25) {
                                    return "Password must be less than 25 characters long";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 40),
                              BlocBuilder<SigninCubit, SigninState>(
                                builder: (context, state) {
                                  final cubit = context.read<SigninCubit>();
                                  return FormButton(
                                    loading: state is SigninLoading,
                                    text: "Sign in",
                                    onPressed: () {
                                      if (signinKey.currentState!.validate()) {
                                        cubit.loginUser(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
