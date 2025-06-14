// import 'package:get/get.dart';
// import 'package:card_scanner/card_scanner.dart';
//
// class ScanCardController extends GetxController {
//   var scannedCard = Rxn<CardDetails>();
//
//   Future<void> scanCard() async {
//     final cardDetails = await CardScanner.scanCard(scanOptions: const CardScanOptions(
//       scanCardHolderName: false,
//       scanExpiryDate: true,
//       //scanCVV: false,
//     ));
//
//     if (cardDetails != null) {
//       scannedCard.value = cardDetails;
//       // Tu peux afficher ou sauvegarder les infos ici
//       print("----------------------*$cardDetails");
//     }
//   }
// }



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
//
// class ScanCardController extends GetxController {
//   final picker = ImagePicker();
//   final detectedText = ''.obs;
//   final imagePath = ''.obs;
//
//   final objectDetector = ObjectDetector(
//     options: ObjectDetectorOptions(
//       mode: DetectionMode.single,
//       classifyObjects: true,
//       multipleObjects: false,
//     ),
//   );
//
//   Future<void> captureCard() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       imagePath.value = pickedFile.path;
//       await detectCard(pickedFile.path);
//     }
//   }
//
//   Future<void> detectCard(String path) async {
//     final inputImage = InputImage.fromFilePath(path);
//     final objects = await objectDetector.processImage(inputImage);
//     if (objects.isNotEmpty) {
//       detectedText.value = 'Carte détectée avec succès';
//     } else {
//       detectedText.value = 'Aucune carte détectée';
//     }
//   }
//
//   @override
//   void onClose() {
//     objectDetector.close();
//     super.onClose();
//   }
// }

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';

class ScanCardController extends GetxController {
  late CameraController cameraController;
  final isCameraInitialized = false.obs;
  final isFlashOn = false.obs;
  final detectedText = ''.obs;
  final ImagePicker _picker = ImagePicker();

  final objectDetector = ObjectDetector(
    options: ObjectDetectorOptions(
      mode: DetectionMode.single,
      classifyObjects: true,
      multipleObjects: false,
    ),
  );

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await cameraController.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      debugPrint('Camera initialization error: $e');
    }
  }

  Future<void> toggleFlash() async {
    if (!cameraController.value.isInitialized) return;
    isFlashOn.value = !isFlashOn.value;
    await cameraController.setFlashMode(
      isFlashOn.value ? FlashMode.torch : FlashMode.off,
    );
  }

  Future<void> captureAndDetect() async {
    if (!cameraController.value.isInitialized || cameraController.value.isTakingPicture) return;
    try {
      final image = await cameraController.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final objects = await objectDetector.processImage(inputImage);
      if (objects.isNotEmpty) {
        detectedText.value = 'Carte détectée';
      } else {
        detectedText.value = 'Aucune carte détectée';
      }
    } catch (e) {
      detectedText.value = 'Erreur de détection';
    }
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController.dispose();
    objectDetector.close();
    super.onClose();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        print('Image sélectionnée : ${image.path}');
      } else {
        print("Aucune image sélectionnée");
      }
    } catch (e) {
      print("Erreur lors de la sélection de l'image : $e");
    }
  }
}
