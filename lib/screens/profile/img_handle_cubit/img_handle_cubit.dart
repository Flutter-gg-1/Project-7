import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'img_handle_state.dart';

class ImgHandleCubit extends Cubit<ImgHandleState> {
  ImgHandleCubit() : super(ImgHandleInitial());

  List<int>? imgCubitFile;

  convortImgUrl({required String? imgUrl}) async {
    try {
      if (imgUrl != null) {
        List<int> imgFile =
            (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
                .buffer
                .asUint8List();
        log("hi img is good");
        imageShow(imgFile);
      } else {
        throw Exception;
      }
    } catch (err) {
      log("hi");
      imageShow(null);
      print(err.toString());
    }
  }

  imageShow(List<int>? imgFile) {
    if (imgFile != null) {
      imgCubitFile = imgFile;
      emit(ImageHereState(imgFile: imgFile));
    }

    if (imgFile == null) {
      emit(ImageNoState());
    }
  }

  imageAdd(List<int> imgFile) {
    imgCubitFile = imgFile;
    emit(ImageHereState(imgFile: imgFile));
  }

  imageDel() {
    imgCubitFile = null;
    emit(ImageNoState());
  }
}
