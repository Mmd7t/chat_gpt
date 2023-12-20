import 'package:chat_gpt/config/enum.dart';
import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/core/widgets/global_btn.dart';
import 'package:chat_gpt/core/widgets/global_textfield.dart';
import 'package:chat_gpt/features/auth/presentation/cubit/signup_cubit.dart/signup_cubit.dart';
import 'package:chat_gpt/features/chat/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPassObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignUpState>(
      builder: (context, state) => Form(
        key: formKey,
        child: Column(
          children: [
            GlobalTextField(
              prefixIcon: Icons.email_rounded,
              hint: 'Email Address',
              textInputType: TextInputType.emailAddress,
              validator: (String? val) {
                if (val!.isEmpty) {
                  return 'Please enter your Email';
                } else if (!val.contains('@')) {
                  return 'Please enter valid email';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                context.read<SignupCubit>().emailChanged(value!);
              },
            ),
            const SizedBox(height: 12),
            GlobalTextField(
              prefixIcon: Icons.lock_rounded,
              hint: 'Password',
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscure: isPassObscure,
              validator: (String? val) {
                if (val!.isEmpty) {
                  return 'Please enter your Password';
                } else if (val.length < 6) {
                  return 'Password must be at least 6 digits';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                context.read<SignupCubit>().passwordChanged(value!);
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPassObscure = !isPassObscure;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: context.color.error,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GlobalButton(
              onTap: context.read<SignupCubit>().state.formStatus ==
                      FormStatus.submissionInProgress
                  ? () {}
                  : () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<SignupCubit>().signUp();
                      }
                    },
              text: 'Sign up',
              type: BtnType.withoutIcon,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      listener: (context, state) {
        if (state.formStatus == FormStatus.invalid) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Invalid form: please fill in all fields'),
              ),
            );
        }
        if (state.formStatus == FormStatus.submissionFailure) {
          context.loaded;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                  'There was an error with the sign up process. Try again.',
                ),
              ),
            );
        }
        if (state.formStatus == FormStatus.submissionInProgress) {
          context.loading;
        }
        if (state.formStatus == FormStatus.submissionSuccess) {
          context.loaded;
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomePage.route, (route) => false);
        }
      },
    );
  }
}
