import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListBloc extends Bloc<ColorsListEvent, ColorsListState> {
  List<ColorModel> colorsList = [];
  bool isColorblindMode = false;
  // List of ColorBlindnessType in the order to cycle through
  final List<ColorBlindnessType> colorBlindnessTypes = [
    ColorBlindnessType.none,
    ColorBlindnessType.protanomaly,
    ColorBlindnessType.deuteranomaly,
    ColorBlindnessType.tritanomaly,
    ColorBlindnessType.protanopia,
    ColorBlindnessType.deuteranopia,
    ColorBlindnessType.tritanopia,
    ColorBlindnessType.achromatopsia,
    ColorBlindnessType.achromatomaly,
  ];
  // Index to keep track of the current color blindness type
  int currentColorBlindnessIndex = 0;

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
          value: const Color(0xFFFF0000),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Green',
          hexCode: '#00FF00',
          value: const Color(0xFF00FF00),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Blue',
          hexCode: '#0000FF',
          value: const Color(0xFF0000FF),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Yellow',
          hexCode: '#FFFF00',
          value: const Color(0xFFFFFF00),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Purple',
          hexCode: '#800080',
          value: const Color(0xFF800080),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Cyan',
          hexCode: '#00FFFF',
          value: const Color(0xFF00FFFF),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Orange',
          hexCode: '#FFA500',
          value: const Color(0xFFFFA500),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Pink',
          hexCode: '#FFC0CB',
          value: const Color(0xFFFFC0CB),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Brown',
          hexCode: '#A52A2A',
          value: const Color(0xFFA52A2A),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
        ColorModel(
          name: 'Gray',
          hexCode: '#808080',
          value: const Color(0xFF808080),
          isBlindMode: false,
          typeSelected: ColorBlindnessType.none,
        ),
      ];

      emit(ColorsListLoaded(colorsList));
    } catch (e) {
      emit(ColorsListErrorState('Failed to load colors list: $e'));
    }
  }

  void _onChangeColorBlindnessEvent(
    ChangeColorBlindnessEvent event,
    Emitter<ColorsListState> emit,
  ) async {
    try {
      isColorblindMode = !isColorblindMode; // Ensure colorblind mode is enabled

      // Increment the index to cycle to the next color blindness type
      currentColorBlindnessIndex =
          (currentColorBlindnessIndex + 1) % colorBlindnessTypes.length;

      // Get the current color blindness type
      ColorBlindnessType typeSelected =
          colorBlindnessTypes[currentColorBlindnessIndex];

      emit(ColorsListLoaded(
        colorsList.map((color) => color.toColorblind(typeSelected)).toList(),
      ));
    } catch (e) {
      emit(ColorsListErrorState('Failed to change color blindness: $e'));
    }
  }

  void _onToggleColorInfoEvent(
    ToggleColorInfoEvent event,
    Emitter<ColorsListState> emit,
  ) async {
    try {
      emit(ColorsListLoaded(
        colorsList
            .map((color) => color.copyWith(showHexValue: event.showHexValue))
            .toList(),
      ));
    } catch (e) {
      emit(ColorsListErrorState('Failed to toggle color info: $e'));
    }
  }
}
