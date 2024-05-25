import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox = const SizedBox(
      height: 16,
    );
    SizedBox sizedBoxWidth = const SizedBox(
      width: 16,
    );

    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Server error',
                    emailAlreadyInUse: (_) => 'Email already in use',
                    invalidEmailAndPassword: (_) =>
                        'Invalid email and password',
                  ),
                ),
              ),
            ),
            (_) {
              //TODO:navigate
            },
          ),
        );
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                  ),
                  onChanged: (email) => context.read<SignInFormBloc>().add(
                        SignInFormEvent.emailChanged(email),
                      ),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (failure) => failure.maybeMap(
                          invalidEmail: (_) => 'Invalid email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                sizedBox,
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (password) => context.read<SignInFormBloc>().add(
                        SignInFormEvent.passwordChanged(password),
                      ),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (failure) => failure.maybeMap(
                              shortPassword: (_) => 'Short password',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                    sizedBoxWidth,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .registerWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                FilledButton(
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                  },
                  child: const Text('Sign In With Google'),
                ),
                const SizedBox(
                  height: 48,
                ),
                SvgPicture.asset(
                  'assets/images/cat_bg.svg',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
