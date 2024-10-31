import 'package:bloc_practice/Utils/image_picker_utils.dart';
import 'package:bloc_practice/bloc/AddListBloc/list_bloc.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/ImagePickerBloc/image_bloc.dart';
import 'package:bloc_practice/switch_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/FavouriteBloc/favourite_bloc.dart';
import 'bloc/SwitchBloc/switch_bloc.dart';
import 'counter_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => ListBloc()),
        BlocProvider(create: (context) => FavouriteBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const MyHomePage(),
      ),
    );
  }
}

