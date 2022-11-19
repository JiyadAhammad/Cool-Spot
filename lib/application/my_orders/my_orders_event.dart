part of 'my_orders_bloc.dart';

abstract class MyOrdersEvent extends Equatable {
  const MyOrdersEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadMyOrders extends MyOrdersEvent {}

class UpdateMyOrders extends MyOrdersEvent {
  const UpdateMyOrders(this.myOrders);

  final List<MyOrders> myOrders;
  @override
  List<Object> get props => <Object>[myOrders];
}
