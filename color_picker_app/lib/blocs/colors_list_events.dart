abstract class ColorsListEvent {}

class LoadColorsListEvent extends ColorsListEvent {}

class ToggleColorblindModeEvent extends ColorsListEvent {}

class ChangeColorBlindnessEvent extends ColorsListEvent {}

class ToggleColorInfoEvent extends ColorsListEvent {
  final bool showHexValue;

  ToggleColorInfoEvent(this.showHexValue);
}
