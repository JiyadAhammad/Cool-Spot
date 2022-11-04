import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.description,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.category,
    required this.isrecommended,
    required this.ispopular,
  });

  final String imageUrl;
  final String productName;
  final double productPrice;
  final String category;
  final bool isrecommended;
  final bool ispopular;
  final String description;

  @override
  List<Object?> get props => <Object?>[
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

  static List<Product> products = <Product>[
    const Product(
      imageUrl:
          'https://loveincorporated.blob.core.windows.net/contentimages/main/1249b51f-4258-44f6-8414-221954ae6a79-waterbottlefacts.jpg',
      productName: 'Bisleri',
      productPrice: 10.0,
      category: 'Water',
      isrecommended: false,
      ispopular: false,
      description: 'fgfhjkl',
    ),
    const Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTpIC4f7ooBZV6-A_Cpslt9IRRpGbVdoV8A&usqp=CAU',
      productName: 'Kinley',
      productPrice: 12.0,
      category: 'Water',
      isrecommended: false,
      ispopular: true,
      description: 'sadfgh',
    ),
    const Product(
      imageUrl:
          'https://traditionallymodernfood.com/wp-content/uploads/2020/05/vanilla-ice-cream-3-ingredients-eggless-11.jpeg',
      productName: 'Vanila',
      productPrice: 30,
      category: 'IceCream',
      isrecommended: true,
      ispopular: false,
      description: 'dsfg',
    ),
    const Product(
      imageUrl:
          'https://static.toiimg.com/thumb/83913875.cms?width=1200&height=900',
      productName: 'Chocolate',
      productPrice: 35,
      category: 'IceCream',
      isrecommended: false,
      ispopular: true,
      description: 'dsfg',
    ),
    const Product(
      imageUrl: 'https://m.media-amazon.com/images/I/71tTYGmAMGL._SX522_.jpg',
      productName: 'Coca cola',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: true,
      description: 'dfg',
    ),
    const Product(
      imageUrl:
          'https://www.pngitem.com/pimgs/m/5-50017_bottle-of-mtn-dew-hd-png-download.png',
      productName: 'Dew',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: false,
      description: 'dfg',
    ),
    const Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcawjcJOFIRy1lq3EKx76d4qbV8MfN13CCjg&usqp=CAU',
      productName: 'Fresh Lime',
      productPrice: 20.0,
      category: 'Fresh Jucie',
      isrecommended: false,
      ispopular: true,
      description: 'dfg',
    ),
    const Product(
      imageUrl:
          'https://5.imimg.com/data5/XT/SR/BW/SELLER-42430332/mango-juice-500x500.jpg',
      productName: 'Mango Juice',
      productPrice: 60.0,
      category: 'Fresh Jucie',
      isrecommended: true,
      ispopular: false,
      description: 'dfg',
    ),
  ];
}
