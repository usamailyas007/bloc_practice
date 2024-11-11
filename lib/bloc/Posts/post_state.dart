import 'package:bloc_practice/Utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../Models/post_model.dart';

class PostState extends Equatable {
  final List<PostModel> postList;
  final PostStatus postStatus;
  final String message;
  const PostState({this.postList = const <PostModel>[],this.postStatus = PostStatus.loading,this.message = ''});

  PostState copyWith({List<PostModel>? postList,PostStatus? postStatus,String? message}) {
    return PostState(
        postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postList,postStatus,message];
}
