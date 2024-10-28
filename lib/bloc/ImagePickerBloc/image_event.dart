import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageEvent extends Equatable{
  const ImageEvent();
  @override
  List<Object> get props => [];
}

class PickCameraImage extends ImageEvent {}

class PickGalleryImage extends ImageEvent {

}