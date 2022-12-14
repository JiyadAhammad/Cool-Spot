import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    this.name,
    this.email,
    this.number,
  });

  final String? name;
  final String? email;
  final String? number;

  @override
  List<Object?> get props => <Object?>[name, email, number];

  static UserProfile fromJson(snapshot) {
    final UserProfile userProfile = UserProfile(
      name: snapshot['name'] as String,
      email: snapshot['email'] as String,
      number: snapshot['pNumber'] as String,
    );
    return userProfile;
  }
}
