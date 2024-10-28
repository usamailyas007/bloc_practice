import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ListState extends Equatable {
  List<String> favouriteList;
  ListState({this.favouriteList = const []});

  ListState copyWith({List<String>? favouriteList}) {
    return ListState(favouriteList: favouriteList ?? this.favouriteList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteList];
}
