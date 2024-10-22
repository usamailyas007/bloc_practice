import 'package:bloc_practice/bloc/SwitchBloc/switch_bloc.dart';
import 'package:bloc_practice/bloc/SwitchBloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/SwitchBloc/switch_event.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Example'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 300,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc,SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print('switch');
                  return Switch(value: state.isSwitch, onChanged: (value){
                    context.read<SwitchBloc>().add(SwitchOnOFEvent());
                  });
                },),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc,SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                print(state.slider);
                return  Container(
                  height: 250,
                  color: Colors.red.withOpacity(state.slider),
                );
              },),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc,SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                print(state.slider);
                return   Slider(value: state.slider, onChanged: (slider){
                  context.read<SwitchBloc>().add(SliderEvent(sliderValue: slider));
                });
              },),
          ],
        ),
      ),
    );
  }
}
