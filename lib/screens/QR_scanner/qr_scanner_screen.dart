// qr_scanner_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/screens/Evaluation/evaluation_screen.dart';
import 'package:project_management_app/screens/QR_scanner/bloc/barcode_scanner_bloc.dart';
import 'package:project_management_app/screens/QR_scanner/bloc/barcode_scanner_event.dart';
import 'package:project_management_app/screens/QR_scanner/bloc/barcode_scanner_state.dart';

import 'package:project_management_app/theme/appcolors.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('QR Code Scanner',
            style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.blueDark,
      ),
      body: BlocProvider(
        create: (_) => BarcodeScannerBloc(),
        child: const BarcodeScannerView(),
      ),
    );
  }
}

class BarcodeScannerView extends StatelessWidget {
  const BarcodeScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BarcodeScannerBloc, BarcodeScannerState>(
            builder: (context, state) {
              if (state is BarcodeInitial) {
                return const Text('Press the button to start scanning.');
              } else if (state is BarcodeScanning) {
                return const CircularProgressIndicator(); // Show progress during scan
              } else if (state is BarcodeScanned) {
                return Text('Scan result: ${state.result}');
              } else if (state is BarcodeScanFailed) {
                return const Text(
                    'Failed to scan the barcode.'); // Show error message
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<BarcodeScannerBloc>(context)
                  .add(StartScan()); // Trigger scan event
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.blueDark, // Set button background color
            ),
            child: const Text(
              'Start Barcode Scan',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
          const SizedBox(height: 20),
          BlocListener<BarcodeScannerBloc, BarcodeScannerState>(
            listener: (context, state) {
              if (state is BarcodeScanned) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EvaluationScreen(projectId: state.result),
                  ),
                );
              }
            },
            child: const SizedBox.shrink(), // This is just a placeholder
          ),
        ],
      ),
    );
  }
}
