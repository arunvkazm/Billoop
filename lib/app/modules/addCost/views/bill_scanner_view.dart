import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/modules/addCost/add_cost_controller.dart';
import 'package:spiltify/app/theme/app_colors.dart';
import 'package:spiltify/app/widgets/common_app_bar.dart';

class BillScannerView extends GetView<AddCostController> {
  const BillScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Camera Scanner",
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            SizedBox.expand(child: CameraPreview(controller.cameraController!)),

            AnimatedBuilder(
              animation: controller.animationController!,
              builder: (context, child) {
                return CustomPaint(
                  painter: ScannerOverlayPainter(
                    animationValue: controller.animationController!.value,
                  ),
                  child: Container(),
                );
              },
            ),

            // Upload & Torch buttons
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Icon(Icons.image, color: Colors.white),
                        SizedBox(height: 4),
                        Text(
                          "Upload Bill",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.toggleFlash();
                    },
                    child: Column(
                      children: [
                        Icon(
                          controller.cameraController!.value.flashMode ==
                                  FlashMode.torch
                              ? Icons.flash_on
                              : Icons.flash_off,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4),
                        Text("Torch", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final double animationValue;

  ScannerOverlayPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final scanSize = size.width * 0.7;
    final left = (size.width - scanSize) / 2;
    final top = (size.height - scanSize) / 2;
    final scannerRect = Rect.fromLTWH(left, top, scanSize, scanSize);

    // Dark overlay
    final overlayPath =
        Path()
          ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
          ..addRRect(RRect.fromRectXY(scannerRect, 0, 0))
          ..fillType = PathFillType.evenOdd;

    final overlayPaint =
        Paint()
          ..color = Colors.black.withValues(alpha: 0.5)
          ..style = PaintingStyle.fill;
    canvas.drawPath(overlayPath, overlayPaint);

    // Corner curves
    final cornerPaint =
        Paint()
          ..color = secondaryClr
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    double len = 24.0;
    // Top-left
    canvas.drawLine(Offset(left, top), Offset(left + len, top), cornerPaint);
    canvas.drawLine(Offset(left, top), Offset(left, top + len), cornerPaint);
    // Top-right
    canvas.drawLine(
      Offset(left + scanSize, top),
      Offset(left + scanSize - len, top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanSize, top),
      Offset(left + scanSize, top + len),
      cornerPaint,
    );
    // Bottom-left
    canvas.drawLine(
      Offset(left, top + scanSize),
      Offset(left + len, top + scanSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left, top + scanSize),
      Offset(left, top + scanSize - len),
      cornerPaint,
    );
    // Bottom-right
    canvas.drawLine(
      Offset(left + scanSize, top + scanSize),
      Offset(left + scanSize - len, top + scanSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanSize, top + scanSize),
      Offset(left + scanSize, top + scanSize - len),
      cornerPaint,
    );

    // 🔄 Scanner Line Animation
    final scanLineY = top + scanSize * animationValue;
    final scanLinePaint =
        Paint()
          ..color = primaryClr
          ..strokeWidth = 3;
    canvas.drawLine(
      Offset(left + 4, scanLineY),
      Offset(left + scanSize - 4, scanLineY),
      scanLinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScannerOverlayPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
