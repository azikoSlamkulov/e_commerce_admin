part of 'colors_toggle_btn_cubit.dart';

abstract class ColorsToggleBtnState extends Equatable {
  const ColorsToggleBtnState();

  @override
  List<Object> get props => [];
}

class ColorsInitialState extends ColorsToggleBtnState {
  final List<bool> isSelected;

  const ColorsInitialState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class ColorsSelectedState extends ColorsToggleBtnState {
  final List<bool> isSelected;
  final String colorName;
  final Color color;

  const ColorsSelectedState(this.isSelected, this.colorName, this.color);
  @override
  List<Object> get props => [isSelected, colorName, color];
}

class ColorsUnSelectedState extends ColorsToggleBtnState {}
