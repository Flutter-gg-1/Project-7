part of 'updateprofile_bloc.dart';

@immutable
sealed class UpdateprofileEvent {}


final class UploadImgEvent extends UpdateprofileEvent {
    final File img;
    UploadImgEvent({required this.img});
}

final class UploadFileEvent extends UpdateprofileEvent {
    final File file;
    UploadFileEvent({required this.file});
}

final class UpdateAllProfileEvent extends UpdateprofileEvent {

}