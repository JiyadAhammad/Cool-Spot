import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    this.email,
    this.uid,
  });
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot['uid'] as String,
      email: snapshot['email'] as String,
    );
  }
  String? uid;
  String? email;

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
