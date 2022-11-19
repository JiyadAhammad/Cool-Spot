import '../../domain/myorders/my_orders.dart';

abstract class MyOrderRepo {
  Stream<List<MyOrders>> getAllOrders();
}
