import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:better_open_file/better_open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class Capture extends StatelessWidget {
  static const id = "capture";
  Capture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(pathBuilder: () => _path(CaptureMode.photo)),
        onMediaTap: (mediaCapture) async {
          OpenFile.open(mediaCapture.filePath);
          final inputImage = InputImage.fromFilePath(mediaCapture.filePath);
          final options = PoseDetectorOptions();
          final poseDetector = PoseDetector(options: options);

          final List<Pose> poses = await poseDetector.processImage(inputImage);
          print("$options + $poseDetector + $poses");
          for (Pose pose in poses) {
            // to access all landmarks
            pose.landmarks.forEach((_, landmark) {
              final type = landmark.type;
              final x = landmark.x;
              final y = landmark.y;
              print("hiiii $type $x $y");
            });

            // to access specific landmarks
            final landmark = pose.landmarks[PoseLandmarkType.nose];
          }
          poseDetector.close();
        },

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