import 'package:equatable/equatable.dart';

import 'item_model.dart';

class FavouriteState extends Equatable {
  final List<Item> items;

  const FavouriteState(this.items);

  FavouriteState copyWith({List<Item>? items}) {
    return FavouriteState(items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
