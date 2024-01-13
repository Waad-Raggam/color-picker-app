import 'package:color_blindness/color_blindness.dart';

abstract class ColorsListEvent {}

class LoadColorsListEvent extends ColorsListEvent {}

class ToggleColorblindModeEvent extends ColorsListEvent {}

class ChangeColorBlindnessEvent extends ColorsListEvent {}
