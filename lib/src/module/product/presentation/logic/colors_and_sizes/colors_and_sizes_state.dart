part of 'colors_and_sizes_cubit.dart';

class ColorsAndSizesState extends Equatable {
  const ColorsAndSizesState();

  @override
  List<Object> get props => [];
}

class ColorsAndSizesInitial extends ColorsAndSizesState {}

class LoadingColorsAndSizesState extends ColorsAndSizesState {}

class LoadedColorsAndSizesState extends ColorsAndSizesState {
  final ProductColorEntity colorsAndSizesList;
  final List<String> selectedImagesList;
  final List<bool> selectedColorsList;
  final List<bool> selectedSizesList;

  const LoadedColorsAndSizesState({
    required this.colorsAndSizesList,
    required this.selectedImagesList,
    required this.selectedColorsList,
    required this.selectedSizesList,
  });
  @override
  List<Object> get props => [
        colorsAndSizesList,
        selectedImagesList,
        selectedColorsList,
        selectedSizesList,
      ];
}

class LoadedColorsState extends ColorsAndSizesState {
  final List<AdminProductColorEntity> colorsList;

  const LoadedColorsState({
    required this.colorsList,
  });
  @override
  List<Object> get props => [
        colorsList,
      ];
}

class ColorsAndSizesFailureState extends ColorsAndSizesState {
  final String message;
  const ColorsAndSizesFailureState(this.message);
  @override
  List<Object> get props => [message];
}
