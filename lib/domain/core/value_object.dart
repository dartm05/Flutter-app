import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
 
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  @override
  bool operator ==(covariant ValueObject other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  String toString() => 'Value(value: $value)';

  @override
  int get hashCode => value.hashCode;
}
