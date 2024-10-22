import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  const SwitchEvent();
  @override
  List<Object> get props => [];
}

class SwitchOnOFEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double sliderValue;
  SliderEvent({required this.sliderValue});

  @override
  // TODO: implement props
  List<Object> get props => [sliderValue];
}