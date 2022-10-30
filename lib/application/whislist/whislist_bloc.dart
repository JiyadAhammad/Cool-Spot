import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/product_model/product_model.dart';
import '../../domain/whishlist/whish_list.dart';

part 'whislist_event.dart';
part 'whislist_state.dart';

class WhislistBloc extends Bloc<WhislistEvent, WhislistState> {
  WhislistBloc() : super(const WhislistLoding()) {
    on<WhislistEvent>(
        (WhislistEvent event, Emitter<WhislistState> emit) async {});
  }
}
