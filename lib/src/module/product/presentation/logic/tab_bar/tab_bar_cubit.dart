import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState(selectedTabValue: 'Women'));

  void getSelectedTabIndex(int newSelectedTabIndex) {
    String selectedTabValue = 'Women';
    switch (newSelectedTabIndex) {
      case 0:
        selectedTabValue = 'Women';
        break;
      case 1:
        selectedTabValue = 'Men';
        break;
      case 2:
        selectedTabValue = 'Kids';
        break;
    }

    emit(TabBarState(selectedTabValue: selectedTabValue));
  }
}
