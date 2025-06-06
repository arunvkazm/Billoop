import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/model/bill_item_model.dart';

class AddCostController extends GetxController with GetSingleTickerProviderStateMixin {

  CameraController? cameraController;
  AnimationController? animationController;
  var isCameraInitialized = false.obs;

  late List<CameraDescription> cameras;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController descController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  var description = ''.obs;
  var amount = ''.obs;
  var selectedDate = DateTime
      .now()
      .obs;
  var isManual = true.obs; // Toggle between manual and scanned
  var billItems = <BillItemModel>[].obs;

  var scannedText = ''.obs;
  var isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  double get total => billItems.fold(0.0, (sum, item) => sum + item.total);

  void addBillItem(BillItemModel item) {
    billItems.add(item);
  }

  void updateQuantity(int index, int delta) {
    billItems[index].quantity += delta;
    if (billItems[index].quantity < 1) billItems[index].quantity = 1;
    billItems.refresh();
  }

  void pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }

  @override
  void onInit() {
    super.onInit();

    billItems.assignAll([
      BillItemModel(name: 'Pina Colada', price: 10.0, quantity: 2),
      BillItemModel(name: 'Pasta', price: 15.0, quantity: 1),
      BillItemModel(name: 'Fries', price: 5.0, quantity: 3),
      BillItemModel(name: 'Water Bottle', price: 2.5, quantity: 2),
    ]);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: false);
  }


  @override
  void onReady() {
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      var status = await Permission.camera.request();

      if (status.isPermanentlyDenied) {
        await Permission.camera.request();
      }

      if (!status.isGranted) {
        await Permission.camera.request();
      }

      cameras = await availableCameras();
      cameraController =
          CameraController(cameras[0], ResolutionPreset.medium);
      await cameraController?.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      Get.snackbar("Error", "Failed to initialize camera: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }



  Future<void> scanReceipt() async {
    try {
      // Request camera permission
      var status = await Permission.camera.request();

      if (!status.isGranted) {
        Get.snackbar(
            'Permission Denied', 'Camera access is required to scan receipts.');
        return;
      }

      isLoading.value = true;

      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (imageFile == null) {
        isLoading.value = false;
        return;
      }

      final inputImage = InputImage.fromFile(File(imageFile.path));
      final textRecognizer = TextRecognizer(
          script: TextRecognitionScript.latin);
      final RecognizedText recognizedText = await textRecognizer.processImage(
          inputImage);

      scannedText.value = recognizedText.text;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      debugPrint("Error => $e");
      Get.snackbar('Error', 'Failed to scan receipt: $e');
    }
  }


  List<Map<String, dynamic>> parseItems(String text) {
    final lines = text.split('\n');
    final itemPattern = RegExp(r'(.+?)\s+(\d+\.\d{2})$');
    List<Map<String, dynamic>> items = [];

    for (var line in lines) {
      final match = itemPattern.firstMatch(line);
      if (match != null) {
        items.add({
          'name': match.group(1)?.trim(),
          'price': double.parse(match.group(2)!),
        });
      }
    }
    return items;
  }

  Future<void> scanFromCameraFrame() async {
    if (cameraController == null || !cameraController!.value.isInitialized)
      return;

    try {
      final XFile file = await cameraController!.takePicture();
      final inputImage = InputImage.fromFilePath(file.path);
      final textRecognizer = TextRecognizer(
          script: TextRecognitionScript.latin);
      final recognizedText = await textRecognizer.processImage(inputImage);
      scannedText.value = recognizedText.text;
    } catch (e) {
      Get.snackbar('Error', 'Failed to process camera frame: $e');
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    animationController?.dispose();
    super.onClose();
  }

  void toggleFlash() async {
    if (cameraController == null) return;

    final currentMode = cameraController!.value.flashMode;
    if (currentMode == FlashMode.torch) {
      await cameraController!.setFlashMode(FlashMode.off);
    } else {
      await cameraController!.setFlashMode(FlashMode.torch);
    }
  }


}

