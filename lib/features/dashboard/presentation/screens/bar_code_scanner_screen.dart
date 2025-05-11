import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with WidgetsBindingObserver {
  late final MobileScannerController controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    controller = MobileScannerController(
      autoStart: false,
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
      formats: [BarcodeFormat.qrCode],
      useNewCameraSelector: true
    );
    // controller.start();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.resumed:
        controller.start();
      case AppLifecycleState.inactive:
        controller.stop();
      default:
    }
  }

  final double dimensions = 250;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double left = (size.width - dimensions) / 2;
    final double top = (size.height - dimensions) / 2;
    final Color shadowColor = Colors.black.withValues(alpha: 0.6);

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            scanWindow: Rect.fromLTWH(left, top, dimensions, dimensions),
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final String? code = barcode.rawValue;
                if (code != null) {
                  controller.stop();
                  Get.back(result: code);
                  break;
                }
              }
            },
          ),
          Positioned.fill(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  height: top,
                  child: Container(color: shadowColor),
                ),
                Positioned(
                  left: 0,
                  top: top + dimensions,
                  right: 0,
                  bottom: 0,
                  child: Container(color: shadowColor),
                ),
                Positioned(
                  left: 0,
                  top: top,
                  width: left,
                  height: dimensions,
                  child: Container(color: shadowColor),
                ),
                Positioned(
                  left: left + dimensions,
                  top: top,
                  right: 0,
                  height: dimensions,
                  child: Container(color: shadowColor),
                ),
                Positioned(
                  left: left,
                  top: top,
                  width: dimensions,
                  height: dimensions,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: context.theme.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
