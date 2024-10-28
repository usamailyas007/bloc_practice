import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/ImagePickerBloc/image_event.dart';
import 'package:bloc_practice/bloc/ImagePickerBloc/image_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../Utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImageEvent,ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super( ImagePickerState()){
    on<PickCameraImage>(cameraCapture);
  }

  void cameraCapture (PickCameraImage event, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.pickCameraImage();
    emit(state.copyWith(file: file));
  }

}