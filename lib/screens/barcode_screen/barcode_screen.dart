import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode!"),
      ),
      body: Center(
        child: BarcodeWidget(
          data: "5000",
          barcode: Barcode.qrCode(),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
