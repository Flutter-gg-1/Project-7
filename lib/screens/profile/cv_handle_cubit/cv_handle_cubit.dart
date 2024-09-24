import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'cv_handle_state.dart';

class CvHandleCubit extends Cubit<CvHandleState> {
  CvHandleCubit() : super(CvHandleInitial());

  List<int>? cvCubitFile;

  cvfileConvort({required String? cvUrl}) async {
    try {
      if (cvUrl != null) {
        List<int> cvFile = (await NetworkAssetBundle(Uri.parse(
                    "https://www.princexml.com/samples/invoice/invoicesample.pdf"))
                .load(
                    "https://www.princexml.com/samples/invoice/invoicesample.pdf"))
            .buffer
            .asUint8List();

        cvShow(cvFile, "CV");
      } else {
        throw Exception;
      }
    } catch (err) {
      cvShow(null, null);
    }
  }

  cvShow(List<int>? cVFile, String? name) {
    if (cVFile != null) {
      cvCubitFile = cVFile;
      emit(CvHereState(cVFile: cVFile, name!));
    }

    if (cVFile == null) {
      emit(CvNoState());
    }
  }

  cvAdd(List<int> cvFile, String cvName) {
    cvCubitFile = cvFile;
    emit(CvHereState(cVFile: cvFile, cvName));
  }

  cvDel() {
    cvCubitFile = null;
    emit(CvNoState());
  }
}
