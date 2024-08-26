import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'multiple_toogle_btn_state.dart';

class MultipleToogleBtnCubit extends Cubit<MultipleToogleBtnState> {
  MultipleToogleBtnCubit()
      : super(const MultipleInitialState([false, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false];

  selected(int selectedIndex) {
    emit(MultipleUnSelectedState());
    isSelected[selectedIndex] = !isSelected[selectedIndex];
    emit(MultipleSelectedState(isSelected));
  }
}
