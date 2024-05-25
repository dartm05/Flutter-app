import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<EmailChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            emailAddress: Email(event.emailStr),
            authFailureOrSuccessOption: none(),
          ),
        );
      },
    );
    on<PasswordChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            password: Password(event.passwordStr),
            authFailureOrSuccessOption: none(),
          ),
        );
      },
    );
    on<SignInWithEmailAndPasswordPressed>(
      (event, emit) async {
        await _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword, emit);
      },
    );
    on<RegisterWithEmailAndPasswordPressed>(
      (event, emit) async {
        await _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword, emit);
      },
    );
    on<SignInWithGooglePressed>(
      (event, emit) async {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await _authFacade.signInWithGoogle();

        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ),
        );
      },
    );
  }

  Future<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required Email emailAddress,
      required Password password,
    }) forwardedCall,
    Emitter<SignInFormState> emit,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isPasswordValid && isEmailValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );

    return state;
  }
}
