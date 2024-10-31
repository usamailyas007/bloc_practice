import 'package:equatable/equatable.dart';

class FavouriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleFavoriteEvent extends FavouriteEvent {
  final int index;

  ToggleFavoriteEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectItemEvent extends FavouriteEvent {
  final int index;
  final bool isSelected;

  SelectItemEvent(this.index, this.isSelected);

  @override
  List<Object?> get props => [index, isSelected];
}

class DeleteSelectedItemsEvent extends FavouriteEvent {}
