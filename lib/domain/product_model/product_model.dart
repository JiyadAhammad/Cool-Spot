import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  const Product({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.category,
    required this.isrecommended,
    required this.ispopular,
  });
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String productName;
  @HiveField(3)
  final double productPrice;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final bool isrecommended;
  @HiveField(6)
  final bool ispopular;
  @HiveField(7)
  final String description;

  @override
  List<Object?> get props => <Object?>[
        id,
        imageUrl,
        productName,
        productPrice,
        category,
        ispopular,
        isrecommended,
        description,
      ];

  static Product fromSnapshot(DocumentSnapshot<Object> snapshot) {
    final Product product = Product(
      id: snapshot.id,
      imageUrl: snapshot['imageUrl'] as String,
      productName: snapshot['name'] as String,
      productPrice: snapshot['price'] as double,
      category: snapshot['catergory'] as String,
      isrecommended: snapshot['isRecommended'] as bool,
      ispopular: snapshot['isPopular'] as bool,
      description: snapshot['decription'] as String,
    );
    return product;
  }
}
