import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/myorders/my_orders.dart';
import '../../infrastructure/myorders/my_order_repository.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  MyOrdersBloc({required MyOrderRepository myOrderRepository})
      : _myOrderRepository = myOrderRepository,
        super(MyOrdersLoding()) {
    on<LoadMyOrders>(onLoadCart);
    on<UpdateMyOrders>(onUpdateMyOrders);
  }
  final MyOrderRepository _myOrderRepository;
  StreamSubscription<dynamic>? _myOrderSubscription;

  FutureOr<void> onLoadCart(
      LoadMyOrders event, Emitter<MyOrdersState> emit) async {
    _myOrderSubscription?.cancel();
    _myOrderSubscription = _myOrderRepository.getAllOrders().listen(
          (List<MyOrders> event) => add(
            UpdateMyOrders(event),
          ),
        );
    // _myOrderSubscription = _myOrderRepository.getAllProduct().listen(
    //       (List<Product> event) => add(
    //         UpdateProduct(event),
    //       ),
    //     );
  }

  FutureOr<void> onUpdateMyOrders(
      UpdateMyOrders event, Emitter<MyOrdersState> emit) {
    emit(
      MyOrderLoded(myOrders: event.myOrders),
    );
  }
}
