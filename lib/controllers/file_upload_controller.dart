import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class FileUploadController {
  //upload picked image file to the firebase storage bucket in the given path

  Future<String> uploadFile(File file, String folderPath) async {
    try {
      // getting the file name from the file path
      final String fileName = basename(file.path);

      // defining the firebase storage destination where the file should be uploaded to
      final String destination = "$folderPath/$fileName";

      //creating the firebase storage reference with the destination file location
      final ref = FirebaseStorage.instance.ref(destination);

      // uploading the file
      final UploadTask task = ref.putFile(file);

      // wait until the task is completed
      final snapshot = await task.whenComplete(() {});

      //getting the downnload url of the uploaded file
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }
}
