import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    this.email,
    this.uid,
    this.name,
    this.pNumber,
  });
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot['uid'] as String,
      email: snapshot['email'] as String,
      name: snapshot['name'] as String,
      pNumber: snapshot['pNumber'] as String,
    );
  }
  String? uid;
  String? email;
  String? name;
  String? pNumber;

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? pNumber,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      pNumber: pNumber ?? this.pNumber,
    );
  }

  Map<String, dynamic> toDocumet() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
      'pNumber': pNumber,
    };
  }

  @override
  List<Object?> get props => <String?>[email, uid, name, pNumber];
}
