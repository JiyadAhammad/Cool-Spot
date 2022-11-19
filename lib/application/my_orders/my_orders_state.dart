part of 'my_orders_bloc.dart';

abstract class MyOrdersState extends Equatable {
  const MyOrdersState();

  @override
  List<Object> get props => <Object>[];
}

class MyOrdersLoding extends MyOrdersState {
  @override
  List<Object> get props => <Object>[];
}

class MyOrderLoded extends MyOrdersState {
  const MyOrderLoded({
    this.myOrders = const <MyOrders>[],
  });
  final List<MyOrders> myOrders;
  @override
  List<Object> get props => <Object>[myOrders];
}

class MyOrdersError extends MyOrdersState {
  @override
  List<Object> get props => <Object>[];
}
