import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/AddListBloc/list_event.dart';
import 'package:bloc_practice/bloc/AddListBloc/list_state.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_event.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_state.dart';

class ListBloc extends Bloc<ListEvent,ListState> {
  final List<String> addList = [];
  ListBloc() : super( ListState()){
    on<AddListEvent>(addListBloc);
    on<RemoveListEvent>(removeListBloc);
  }

  void addListBloc (AddListEvent event, Emitter<ListState> emit){
    addList.add(event.task);
    emit(state.copyWith(favouriteList: List.from(addList)));
  }

  void removeListBloc (RemoveListEvent event, Emitter<ListState> emit){
    addList.remove(event.task);
    emit(state.copyWith(favouriteList: List.from(addList)));
  }

}