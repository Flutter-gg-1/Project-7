// barcode_scanner_state.dart

import 'package:equatable/equatable.dart';

// Barcode Scanner States
abstract class BarcodeScannerState extends Equatable {
  @override
  List<Object> get props => [];
}

class BarcodeInitial extends BarcodeScannerState {}

class BarcodeScanning extends BarcodeScannerState {}

class BarcodeScanned extends BarcodeScannerState {
  final String result;

  BarcodeScanned(this.result);

  @override
  List<Object> get props => [result];
}

class BarcodeScanFailed extends BarcodeScannerState {}
