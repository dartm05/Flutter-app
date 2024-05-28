//Unique ID
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/value_object.dart';

part 'user.freezed.dart';

@freezed
abstract class DomainUser with _$DomainUser {
  factory DomainUser({
    required UniqueId id,
  }) = _DomainUser;
}
