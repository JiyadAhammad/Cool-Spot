import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/cart/cart_model/cart_model.dart';
import '../../domain/checkout/checkout_model.dart';
import '../../domain/payment/payment.dart';
import '../../domain/product_model/product_model.dart';
import '../../infrastructure/checkout/checkout_repository.dart';
import '../cart/cart_bloc.dart';
import '../payment/payment_method_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    // required PaymentMethodBloc paymentBloc,
    required CartBloc cartBloc,
    // required PaymentMethodBloc paymentBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        // _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoded(
                  products: (cartBloc.state as CartLoaded).cart.product,
                  deliveryFee: (cartBloc.state as CartLoaded).cart.deliveryFees,
                  subTotal: (cartBloc.state as CartLoaded).cart.subTotalString,
                  total: (cartBloc.state as CartLoaded).cart.totalPrices,
                )
              : CheckoutLoding(),
        ) {
    on<UpdateChekout>(onUpdateChekout);
    on<ConfirmChekout>(onConfirmChekout);

    cartSubscription = _cartBloc.stream.listen(
      (CartState state) {
        if (state is CartLoaded) {
          add(
            UpdateChekout(cart: state.cart),
          );
        }
      },
    );
    // paymentSubscription = _paymentBloc.stream.listen(
    //   (PaymentMethodState state) {
    //     if (state is PaymentMethodLoded) {
    //       add(
    //         UpdateChekout(paymentMethod: state.paymentMethod),
    //       );
    //     }
    //   },
    // );
  }
  final CartBloc _cartBloc;
  // final PaymentMethodBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription<dynamic>? cartSubscription;
  // StreamSubscription<dynamic>? paymentSubscription;
  StreamSubscription<dynamic>? checkoutSubscription;

  void onUpdateChekout(
    UpdateChekout event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoded) {
      final CheckoutLoded state = this.state as CheckoutLoded;
      emit(
        CheckoutLoded(
          location: event.location ?? state.location,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          landMark: event.landMark ?? state.landMark,
          products: event.cart?.product ?? state.products,
          subTotal: event.cart?.subTotalString ?? state.subTotal,
          deliveryFee: event.cart?.deliveryFees ?? state.deliveryFee,
          total: event.cart?.totalPrices ?? state.total,
          paymentMethodType: event.paymentMethod ?? state.paymentMethodType,
        ),
      );
    }
  }

  Future<void> onConfirmChekout(
    ConfirmChekout event,
    Emitter<CheckoutState> emit,
  ) async {
    checkoutSubscription?.cancel();
    if (state is CheckoutLoded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        log('Done');
        emit(CheckoutLoding());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    cartSubscription?.cancel();
    // paymentSubscription?.cancel();
    return super.close();
  }
}
