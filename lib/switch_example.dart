import 'dart:io';

import 'package:bloc_practice/bloc/ImagePickerBloc/image_bloc.dart';
import 'package:bloc_practice/bloc/ImagePickerBloc/image_state.dart';
import 'package:bloc_practice/bloc/SwitchBloc/switch_bloc.dart';
import 'package:bloc_practice/bloc/SwitchBloc/switch_state.dart';
import 'package:bloc_practice/list_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ImagePickerBloc/image_event.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 30,),
              BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(PickCameraImage());
                    },
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.grey),
                      child: state.file == null ? const Center(child: Text("Pick Image")) :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                          child: Image.file(File(state.file!.path.toString()),fit: BoxFit.cover,)),
                    ),
                  );
              },),
              SizedBox(height: 30,),
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
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListExample(),));
              },
                  child: const Text(
                      'Next'
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
