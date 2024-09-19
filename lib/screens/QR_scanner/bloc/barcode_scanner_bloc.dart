import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barcode_scanner_event.dart';
import 'barcode_scanner_state.dart';

// Barcode Scanner Bloc
class BarcodeScannerBloc extends Bloc<BarcodeScannerEvent, BarcodeScannerState> {
  BarcodeScannerBloc() : super(BarcodeInitial()) {
    // Register event handler for StartScan
    on<StartScan>(_onStartScan);
  }

  // Handler for StartScan event
  Future<void> _onStartScan(StartScan event, Emitter<BarcodeScannerState> emit) async {
    emit(BarcodeScanning()); // Emit scanning state

    try {
      // Start the barcode scan
      String scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#FF6666', // Overlay color
        'Cancel',  // Cancel button text
        true,      // Show flash icon
        ScanMode.BARCODE, // Scan mode (QR or BARCODE)
      );

      if (scanResult != '-1') {
        emit(BarcodeScanned(scanResult)); // Emit success state with result
      } else {
        emit(BarcodeInitial()); // Emit initial state if scan is canceled
      }
    } catch (e) {
      emit(BarcodeScanFailed()); // Emit failure state in case of an error
    }
  }
}
