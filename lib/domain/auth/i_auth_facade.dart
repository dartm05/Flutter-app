import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {

  Future<Either<AuthFailure,Unit>> registerWithEmailAndPassword({
    @required Email emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure,Unit>> signInWithEmailAndPassword({
    @required Email emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure,Unit>> signInWithGoogle();
}