import 'package:color_picker_app/models/colors_list_model.dart';

abstract class ColorsListState {}

class ColorsListInitial extends ColorsListState {}

class ColorsListLoading extends ColorsListState {}

class ColorsListLoaded extends ColorsListState {
  final List<ColorModel> colors;

  ColorsListLoaded(this.colors);
}

class ColorsListErrorState extends ColorsListState {
  final String errorMessage;

  ColorsListErrorState(this.errorMessage);
}
