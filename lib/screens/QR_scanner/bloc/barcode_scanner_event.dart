// barcode_scanner_event.dart

import 'package:equatable/equatable.dart';

// Barcode Scanner Events
abstract class BarcodeScannerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartScan extends BarcodeScannerEvent {}
