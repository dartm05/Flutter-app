import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/value_object.dart';
import '../../domain/auth/user.dart';

extension FirebaseUserDomainX on User {
  DomainUser toDomain() {
    return DomainUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
