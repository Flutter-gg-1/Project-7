import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:zxing2/qrcode.dart';

readQR()  {
  var image =  img.decodePng(File('assets/qr.png').readAsBytesSync())!;

  LuminanceSource source = RGBLuminanceSource(
      image.width,
      image.height,
      image
          .convert(numChannels: 4)
          .getBytes(order: img.ChannelOrder.rgba)
          .buffer
          .asInt32List());
  var bitmap = BinaryBitmap(HybridBinarizer(source));

  var reader = QRCodeReader();
  var result = reader.decode(bitmap);
  print(result.text);
}
