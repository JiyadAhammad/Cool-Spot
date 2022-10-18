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
  static List<Category> categories = <Category>[
    const Category(
      name: 'Smoothies',
      imageUrl:
          'https://img.taste.com.au/RemyDecY/w720-h480-cfill-q80/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg',
    ),
    const Category(
      name: 'Cool Drinks',
      imageUrl:
          'https://3.imimg.com/data3/DS/UB/MY-14503484/soft-drink-500x500.png',
    ),
    const Category(
      name: 'Water',
      imageUrl:
          'https://loveincorporated.blob.core.windows.net/contentimages/main/1249b51f-4258-44f6-8414-221954ae6a79-waterbottlefacts.jpg',
    ),
  ];
}
