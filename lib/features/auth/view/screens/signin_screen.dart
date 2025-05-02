import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/dependency_injection.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/cubits/signin_cubit/signin_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/form_button.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/snack_bar.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/text_form_field.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/screens/bottom_nav_bar_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              const BackGroundImage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.grey,
                      ),
                      child: Form(
                        key: signinKey,
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                "Sign in",
                                style: AppTextStyles.font22WhiteBold,
                              ),
                              const SizedBox(height: 24),
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
                                        ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                        )
                                        : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.visibility_off_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                controller: passwordController,
                                hint: "Password",
                                icon: Icons.password_rounded,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a password";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              BlocBuilder<SigninCubit, SigninState>(
                                builder: (context, state) {
                                  final cubit = context.read<SigninCubit>();
                                  return CustomButton(
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
