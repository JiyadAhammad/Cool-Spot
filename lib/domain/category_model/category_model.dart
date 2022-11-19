import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.name,
    required this.imageUrl,
  });
  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => <Object?>[name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot<Object> snapshot) {
    final Category category = Category(
      name: snapshot['name'] as String,
      imageUrl: snapshot['imageUrl'] as String,
    );
    return category;
  }
}
