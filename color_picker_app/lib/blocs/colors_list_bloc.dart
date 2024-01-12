import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListBloc extends Bloc<ColorsListEvent, ColorsListState> {
  List<ColorModel> colorsList = [];
  bool isColorblindMode = false;

  ColorsListBloc() : super(ColorsListInitial()) {
    on<LoadColorsListEvent>(_onLoadColorsListEvent);
    on<ChangeColorBlindnessEvent>(_onChangeColorBlindnessEvent);
  }

  void _onLoadColorsListEvent(
      LoadColorsListEvent event, Emitter<ColorsListState> emit) async {
    emit(ColorsListLoading());
    try {
      colorsList = [
        ColorModel(
            name: 'Red',
            hexCode: '#FF0000',
            value: Color(0xFFFF0000),
            isBlindMode: false,
            typeSelected: ColorBlindnessType.none),
        ColorModel(
            name: 'Green',
            hexCode: '#00FF00',
            value: Color(0xFF00FF00),
            isBlindMode: false,
            typeSelected: ColorBlindnessType.none),
        ColorModel(
            name: 'Blue',
            hexCode: '#0000FF',
            value: Color(0xFF0000FF),
            isBlindMode: false,
            typeSelected: ColorBlindnessType.none),
      ];

      emit(ColorsListLoaded(colorsList));
    } catch (e) {
      emit(ColorsListErrorState('Failed to load colors list: $e'));
    }
  }

  void _onChangeColorBlindnessEvent(
      ChangeColorBlindnessEvent event, Emitter<ColorsListState> emit) async {
    try {
      isColorblindMode = !isColorblindMode; // Ensure colorblind mode is enabled
      if (isColorblindMode) {
        ColorBlindnessType typeSelected = ColorBlindnessType.achromatomaly;
        emit(ColorsListLoaded(
          colorsList.map((color) => color.toColorblind(typeSelected)).toList(),
        ));
      } else {
        ColorBlindnessType typeSelected = ColorBlindnessType.none;
        emit(ColorsListLoaded(colorsList));
      }
    } catch (e) {
      emit(ColorsListErrorState('Failed to change color blindness: $e'));
    }
  }
}
