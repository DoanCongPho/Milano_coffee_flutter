import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Camera scanner
          MobileScanner(
            scanWindow: Rect.fromCenter(
              center: MediaQuery.of(context).size.center(Offset.zero),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
            ),
            onDetect: (capture) {
              final barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final String? code = barcode.rawValue;
                if (code != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("QR Code: $code")));
                  debugPrint("QR Code: $code");
                }
              }
            },
          ),

          /// Overlay
          _ScannerOverlay(),
        ],
      ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double overlaySize = constraints.maxWidth * 0.7;

        return Stack(
          children: [
            // Blurred background with transparent square in the middle
            ClipPath(
              clipper: _HoleClipper(overlaySize),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: Colors.black.withOpacity(0.3), // slight dark overlay
                ),
              ),
            ),

            // White border square
            Align(
              alignment: Alignment.center,
              child: Container(
                width: overlaySize,
                height: overlaySize,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HoleClipper extends CustomClipper<Path> {
  final double overlaySize;

  _HoleClipper(this.overlaySize);

  @override
  Path getClip(Size size) {
    final path = Path();

    // Full screen path
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create rounded rectangle "hole" in the middle
    final holeRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: overlaySize,
      height: overlaySize,
    );

    path.addRRect(RRect.fromRectAndRadius(holeRect, Radius.circular(12)));

    // Use even-odd fill to "punch out" the hole
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
