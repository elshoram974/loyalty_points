import 'package:image_picker/image_picker.dart';

abstract final class PickerHelper {
  const PickerHelper();
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> getImage(
      [ImageSource source = ImageSource.gallery]) async {
    return _picker.pickImage(source: source);
  }
}
