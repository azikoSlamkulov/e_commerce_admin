import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'colors_toggle_btn_state.dart';

class ColorsToggleBtnCubit extends Cubit<ColorsToggleBtnState> {
  ColorsToggleBtnCubit()
      : super(const ColorsInitialState(
            [false, false, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false, false];
  String selectedColorName = '';
  Color selectedColor = Colors.white;
  selected(int selectedIndex) {
    emit(ColorsUnSelectedState());
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    switch (selectedIndex) {
      case 0:
        selectedColorName = 'Black';
        selectedColor = Colors.black;
        break;
      case 1:
        selectedColorName = 'White';
        selectedColor = const Color(0xffff6f6f6);
        break;
      case 2:
        selectedColorName = 'Red';
        selectedColor = const Color(0xfffb82222);
        break;
      case 3:
        selectedColorName = 'Grey';
        selectedColor = const Color(0xfffbea9a9);
        break;
      case 4:
        selectedColorName = 'Yellow';
        selectedColor = const Color(0xfffe2bb8d);
        break;
      case 5:
        selectedColorName = 'Blue';
        selectedColor = const Color(0xfff151867);
        break;
    }
    emit(ColorsSelectedState(isSelected, selectedColorName, selectedColor));
  }
}
