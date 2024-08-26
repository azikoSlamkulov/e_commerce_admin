part of 'multiple_toogle_btn_cubit.dart';

abstract class MultipleToogleBtnState extends Equatable {
  const MultipleToogleBtnState();

  @override
  List<Object> get props => [];
}

class MultipleInitialState extends MultipleToogleBtnState {
  final List<bool> isSelected;

  const MultipleInitialState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class MultipleSelectedState extends MultipleToogleBtnState {
  final List<bool> isSelected;

  const MultipleSelectedState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class MultipleUnSelectedState extends MultipleToogleBtnState {}
