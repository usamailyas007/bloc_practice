import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/FavouriteBloc/favourite_bloc.dart';
import 'bloc/FavouriteBloc/favourite_state.dart';
import 'bloc/FavouriteBloc/favourite_event.dart';

class FavouriteApp extends StatelessWidget {
  const FavouriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavouriteBloc>().add(DeleteSelectedItemsEvent());
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ListTile(
                leading: Checkbox(
                  value: item.isSelected,
                  onChanged: (bool? value) {
                    if (value != null) {
                      context.read<FavouriteBloc>().add(SelectItemEvent(index, value));
                    }
                  },
                ),
                title: Text(item.title),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: item.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<FavouriteBloc>().add(ToggleFavoriteEvent(index));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
