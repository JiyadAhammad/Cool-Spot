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
      name: 'Fresh Jucie',
      imageUrl:
          'https://sf.ezoiccdn.com/ezoimgfmt/www.caribbeangreenliving.com/wp-content/uploads/2015/08/Fruit-Juices.jpg?ezimgfmt=ng%3Awebp%2Fngcb82%2Frs%3Adevice%2Frscb82-2',
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
    const Category(
      name: 'IceCream',
      imageUrl:
          'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/ae3qqfev6j7hzhxw6if3',
    ),
  ];
}
