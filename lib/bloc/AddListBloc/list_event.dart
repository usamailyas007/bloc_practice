import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable{
  const ListEvent();

}

class AddListEvent extends ListEvent {
  final String task;

  const AddListEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveListEvent extends ListEvent {
  final Object task;

  const RemoveListEvent({required this.task});
  @override
  List<Object> get props => [task];

}