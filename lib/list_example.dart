import 'package:bloc_practice/bloc/AddListBloc/list_bloc.dart';
import 'package:bloc_practice/bloc/AddListBloc/list_event.dart';
import 'package:bloc_practice/bloc/AddListBloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Add List Example"),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          for(int i = 0;i < 5;i++){
            context.read<ListBloc>().add(const AddListEvent(task: "Task"));
          }
      },),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if(state.favouriteList.isEmpty){
            return const Center(child: Text("No List Found"));
          } else if(state.favouriteList.isNotEmpty){
            return ListView.builder(
              itemCount: state.favouriteList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(index.toString(),style: const TextStyle(fontSize: 14),),
                  title: Text(state.favouriteList[index]),
                  trailing: InkWell(
                    onTap: (){
                      context.read<ListBloc>().add(RemoveListEvent(task: state.favouriteList[index]));
                    },
                      child: const Icon(Icons.delete)),
                );
              },);
          } else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
