import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    this.uid,
  });
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot.id,
      email: snapshot['email'] as String,
    );
  }
  final String? uid;
  final String email;

  UserModel copyWith({
    String? uid,
    String? email,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toDocumet() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
    };
  }

  @override
  List<Object?> get props => <String?>[email, uid];
}
