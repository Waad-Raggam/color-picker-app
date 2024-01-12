import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListBloc extends Bloc<ColorsListEvent, ColorsListState> {
  List<ColorModel> colorsList = [];

  ColorsListBloc() : super(ColorsListInitial()) {
    on<LoadColorsListEvent>(_onLoadColorsListEvent);
  }

  void _onLoadColorsListEvent(
      LoadColorsListEvent event, Emitter<ColorsListState> emit) async {
    emit(ColorsListLoading());
    try {
      colorsList = [
        ColorModel(name: 'Red', hexCode: '#FF0000', value: 0xFFFF0000),
        ColorModel(name: 'Green', hexCode: '#00FF00', value: 0xFF00FF00),
        ColorModel(name: 'Blue', hexCode: '#0000FF', value: 0xFF0000FF),
      ];

      emit(ColorsListLoaded(colorsList));
    } catch (e) {
      emit(ColorsListErrorState('Failed to load colors list: $e'));
    }
  }
}
