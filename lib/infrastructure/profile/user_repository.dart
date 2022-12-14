import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/profile/profile.dart';
import 'iuser_repo.dart';

class UserRepository implements IUserRepo {
  UserRepository() : firestore = FirebaseFirestore.instance;
  final FirebaseFirestore firestore;
  UserProfile? userProfile;
  @override
  dynamic getUserInformation() async {
    firestore
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userProfile = UserProfile.fromJson(value.data());
    });
    log('${userProfile!.name} name from firabse');
    // return firestore
    //     .collection('user')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get()
    //     .then((value){UserProfile.fromJson(value.data()!)} );
  }
}
