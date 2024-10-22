import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/SwitchBloc/switch_event.dart';
import 'package:bloc_practice/bloc/SwitchBloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState> {

  SwitchBloc() : super(SwitchState()){
    on<SwitchOnOFEvent>(switchOnOF);
    on<SliderEvent>(sliderFunction);
  }

  void switchOnOF (SwitchOnOFEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void sliderFunction (SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.sliderValue.toDouble()));
  }
}