import 'package:project1/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const message = 'Kgaste papi';
    return Error.safeToString(message);
  }
}
