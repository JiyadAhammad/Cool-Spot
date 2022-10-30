part of 'whislist_bloc.dart';

abstract class WhislistState extends Equatable {
  const WhislistState();

  @override
  List<Object> get props => <Object>[];
}

class WhislistLoding extends WhislistState {
  const WhislistLoding({
    this.whishList = const WhishList(),
  });

  final WhishList whishList;

  @override
  List<Object> get props => <Object>[whishList];
}

class WhislistLoded extends WhislistState {}

class WhislistError extends WhislistState {}
