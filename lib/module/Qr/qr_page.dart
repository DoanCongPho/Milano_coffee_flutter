import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/widget/home_header.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            Expanded(
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
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
            ),
          ],
        ),
      ),
    );
  }
}
