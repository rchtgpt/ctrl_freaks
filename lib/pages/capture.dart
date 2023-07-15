import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:better_open_file/better_open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ctrl_freaks/firebase_options.dart';



class Capture extends StatelessWidget {
  static const id = "capture";
  Capture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            );
            ImagePicker imagePicker = ImagePicker();
            XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
            print('hi ${file?.path}');

            if (file == null) return;
            
            // Generate a unique file name for the file
            String uniqueFileName = DateTime.now().toString();

            // upload to firebase storage
            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirImages = referenceRoot.child('images');

            // creating a reference of images to be stored
            Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

            // storing the file
            try {
              await referenceImageToUpload.putFile(File(file!.path));
            } catch(error) {
              print("Error uploading image to Firebase");
            }
          },
          icon: Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

Future<String> _path(CaptureMode captureMode) async {
  final Directory extDir = await getTemporaryDirectory();
  final testDir =
  await Directory('${extDir.path}/test').create(recursive: true);
  final String fileExtension =
  captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
  final String filePath =
      '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
  return filePath;
}