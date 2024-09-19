import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:project_management_app/theme/appcolors.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String barcodeScanRes = 'Unknown';

  // Function to start scanning
  Future<void> startBarcodeScan() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#FF6666', // Color overlay for the scanner window
        'Cancel', // Cancel button text
        true, // Show flash icon for better lighting in low light conditions
        ScanMode
            .BARCODE, // You can set ScanMode.QR for QR scanning or BARCODE for barcodes
      );
      if (!mounted) return;
      setState(() {
        barcodeScanRes = scanResult != '-1' ? scanResult : 'Scan canceled';
      });
    } catch (e) {
      setState(() {
        barcodeScanRes = 'Failed to scan the barcode.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner',
            style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.blueDark,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startBarcodeScan,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors
                    .blueDark, // Set the background color to AppColors.blueDark
              ),
              child: const Text(
                'Start Barcode Scan',
                style:
                    TextStyle(color: Colors.white), // Text color set to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
