import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/utils/snackbar_utils.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/widgets/custom_text_form.dart';
import 'package:lms_adv/features/auth/bloc/login/login_bloc.dart';
import 'package:lms_adv/core/bloc/exports.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isObscure = true;

  bool isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),

                /// Heading
                AppText("Welcome Back", type: AppTextType.heading),

                const SizedBox(height: 8),

                /// Body
                AppText(
                  "Login to continue",
                  type: AppTextType.body,
                  color: Colors.grey,
                ),

                const SizedBox(height: 40),

                /// Email Label
                AppText("Email", type: AppTextType.label),

                const SizedBox(height: 10),

                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    final emailRegex = RegExp(
                      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return "enter valid email";
                    }
                    return null;
                  },
                  controller: _emailController,
                  obscureText: false,
                  prefixIcon: Icon(Icons.email),
                ),

                const SizedBox(height: 20),

                /// Password Label
                AppText("Password", type: AppTextType.label),

                const SizedBox(height: 10),

                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 6) {
                      return "name should be greater than 5 letter";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  obscureText: _isObscure,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: AppText(
                      "Forgot Password?",
                      type: AppTextType.caption,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Login Button
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loaded: (msg) {
                        context.goNamed(RouteName.home);
                        AppSnackBar.success(context, message: msg);
                      },
                      failure: (failure) {
                        AppSnackBar.error(context, message: failure.toString());
                      },
                    );
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: "Login",
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (_formkey.currentState?.validate() == false) {
                          return;
                        }
                        context.read<LoginBloc>().add(
                          LoginEvent.login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Text("Dont have account?"),
                    TextButton(
                      onPressed: () {
                        context.go(RouteName.signup);
                      },
                      child: Text("Signup"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
