import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Utils/enums.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_event.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_state.dart';
import 'package:bloc_practice/bloc/Posts/post_event.dart';
import 'package:bloc_practice/bloc/Posts/post_state.dart';

import '../../Repository/post_repo.dart';

class PostBloc extends Bloc<PostEvent,PostState> {

  PostRespository postRepository = PostRespository();
  PostBloc() : super(const PostState()){
    on<FetchPostEvent>(fetchPost);
  }

  void fetchPost (FetchPostEvent event, Emitter<PostState> emit){
    postRepository.fetchPost().then((value){
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: "success",
        postList: value
      ));
    }).onError((error, stack){});
  }

}