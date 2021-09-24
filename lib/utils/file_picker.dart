import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePick {
  static Future<File?> pickSingleFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      return File(result.files.first.path!);
    }
  }
}
