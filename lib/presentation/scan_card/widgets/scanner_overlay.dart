import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerOverlay extends StatelessWidget {
  final Widget child;

  const ScannerOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          /// Caméra en fond
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: child,
          ),
          /// Bordures arrondies aux coins
          CustomPaint(
            size: Size(double.infinity, 220.h),
            painter: ScannerOverlayPainter(
              borderRadius: 20.r,
              overlayWidth: MediaQuery.of(context).size.width,
              overlayHeight: 220.h,
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final double borderRadius;
  final double overlayWidth;
  final double overlayHeight;

  ScannerOverlayPainter({
    required this.borderRadius,
    required this.overlayWidth,
    required this.overlayHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 20.0;

    // Coins
    final topLeft = Offset(0, 0);
    final topRight = Offset(overlayWidth, 0);
    final bottomLeft = Offset(0, overlayHeight);
    final bottomRight = Offset(overlayWidth, overlayHeight);

    // Haut gauche
    canvas.drawLine(topLeft, topLeft.translate(cornerLength, 0), paint);
    canvas.drawLine(topLeft, topLeft.translate(0, cornerLength), paint);

    // Haut droit
    canvas.drawLine(topRight, topRight.translate(-cornerLength, 0), paint);
    canvas.drawLine(topRight, topRight.translate(0, cornerLength), paint);

    // Bas gauche
    canvas.drawLine(bottomLeft, bottomLeft.translate(cornerLength, 0), paint);
    canvas.drawLine(bottomLeft, bottomLeft.translate(0, -cornerLength), paint);

    // Bas droit
    canvas.drawLine(bottomRight, bottomRight.translate(-cornerLength, 0), paint);
    canvas.drawLine(bottomRight, bottomRight.translate(0, -cornerLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
