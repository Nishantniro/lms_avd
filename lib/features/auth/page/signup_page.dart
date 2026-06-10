import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/utils/snackbar_utils.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/widgets/custom_text_form.dart';
import 'package:lms_adv/features/auth/bloc/signup/signup_bloc.dart';
import 'package:lms_adv/features/auth/model/signup_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isObscure = true;

  bool isLoading = false;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),

                /// Heading
                AppText("Welcome", type: AppTextType.heading),

                const SizedBox(height: 8),

                /// Body
                AppText(
                  "SignUp to continue",
                  type: AppTextType.body,
                  color: Colors.grey,
                ),

                const SizedBox(height: 40),

                AppText("Name", type: AppTextType.label),

                const SizedBox(height: 10),
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 6) {
                      return "name should be greater than 5";
                    }

                    return null;
                  },
                  controller: _nameController,
                  obscureText: false,
                  prefixIcon: Icon(Icons.person),
                ),

                const SizedBox(height: 20),

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
                BlocConsumer<SignupBloc, SignupState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loaded: (msg) {
                        context.goNamed(RouteName.verifyemail);
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
                        final signUp = SignupModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        context.read<SignupBloc>().add(
                          SignupEvent.signup(signupmodel: signUp),
                        );
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Text("Already have account?"),
                    TextButton(
                      onPressed: () {
                        context.go(RouteName.login);
                      },
                      child: Text("Login"),
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
