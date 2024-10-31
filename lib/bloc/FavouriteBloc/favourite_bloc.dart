import 'package:bloc/bloc.dart';
import 'favourite_event.dart';
import 'favourite_state.dart';
import 'item_model.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState(_generateInitialItems())) {
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<SelectItemEvent>(_onSelectItem);
    on<DeleteSelectedItemsEvent>(_onDeleteSelectedItems);
  }

  static List<Item> _generateInitialItems() {
    return List.generate(10, (index) => Item(title: 'Item ${index + 1}'));
  }

  void _onToggleFavorite(ToggleFavoriteEvent event, Emitter<FavouriteState> emit) {
    final updatedItems = List<Item>.from(state.items);
    final item = updatedItems[event.index];

    updatedItems[event.index] = item.copyWith(isFavorite: !item.isFavorite);

    emit(state.copyWith(items: updatedItems));
  }

  void _onSelectItem(SelectItemEvent event, Emitter<FavouriteState> emit) {
    final updatedItems = List<Item>.from(state.items);
    final item = updatedItems[event.index];

    updatedItems[event.index] = item.copyWith(isSelected: event.isSelected);

    emit(state.copyWith(items: updatedItems));
  }


  void _onDeleteSelectedItems(DeleteSelectedItemsEvent event, Emitter<FavouriteState> emit) {
    final updatedItems = state.items.where((item) => !item.isSelected).toList();
    emit(state.copyWith(items: updatedItems));
  }
}
