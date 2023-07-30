import 'package:meta/meta.dart';

typedef UserId = String;

@immutable
class User {
  final UserId id;

  const User(this.id);

  User copyWith(UserId? id) => User(id ?? this.id);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(covariant User other) => identical(other, this) || other.id == id;
}
