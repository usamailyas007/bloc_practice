import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickCameraImage() async{
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }

}