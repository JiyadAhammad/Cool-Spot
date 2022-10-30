part of 'whislist_bloc.dart';

abstract class WhislistState extends Equatable {
  const WhislistState();

  
}

class WhislistLoded extends WhislistState {
  const WhislistLoded({
    this.whishList = const WhishList(),
  });

  final WhishList whishList;

  @override
  List<Object> get props => <Object>[whishList];
}

class WhislistLoding extends WhislistState {
  @override
  List<Object> get props => <Object>[];
}

class WhislistError extends WhislistState {
  @override
  List<Object> get props => <Object>[];
}
