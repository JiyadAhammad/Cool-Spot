import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
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

  @override
  List<Object?> get props => <Object?>[
        imageUrl,
        productName,
        productPrice,
        category,
        ispopular,
        isrecommended,
      ];
  static List<Product> products = <Product>[
    const Product(
      imageUrl:
          'https://img.taste.com.au/RemyDecY/w720-h480-cfill-q80/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg',
      productName: 'Coca cola',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: true,
    ),
    const Product(
      imageUrl:
          'https://3.imimg.com/data3/DS/UB/MY-14503484/soft-drink-500x500.png',
      productName: 'Dew',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: false,
    ),
    const Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcawjcJOFIRy1lq3EKx76d4qbV8MfN13CCjg&usqp=CAU',
      productName: 'Fresh Lime',
      productPrice: 20.0,
      category: 'Smoothies',
      isrecommended: false,
      ispopular: true,
    ),
    const Product(
      imageUrl:
          'https://loveincorporated.blob.core.windows.net/contentimages/main/1249b51f-4258-44f6-8414-221954ae6a79-waterbottlefacts.jpg',
      productName: 'Mango Juice',
      productPrice: 60.0,
      category: 'Smoothies',
      isrecommended: true,
      ispopular: false,
    ),
    const Product(
      imageUrl: '',
      productName: 'Bisleri',
      productPrice: 10.0,
      category: 'Water',
      isrecommended: false,
      ispopular: false,
    ),
    const Product(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTpIC4f7ooBZV6-A_Cpslt9IRRpGbVdoV8A&usqp=CAU',
      productName: 'Kinley',
      productPrice: 12.0,
      category: 'Water',
      isrecommended: false,
      ispopular: true,
    ),
  ];
}
