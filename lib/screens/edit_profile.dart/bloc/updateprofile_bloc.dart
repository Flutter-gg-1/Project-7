import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/setup/init_setup.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

part 'updateprofile_event.dart';
part 'updateprofile_state.dart';

class UpdateprofileBloc extends Bloc<UpdateprofileEvent, UpdateprofileState> {
  final UserModel user = getIt.get<DataLayer>().userInfo!; // Get user info
  File? file;
  ApiNetowrok api = ApiNetowrok();

  late Future<File?> imgFuture;

  late String fName = user.firstName ?? '';
  late String lName = user.lastName ?? '';
  late String github = user.link?.github ?? '';
  late String linkedin = user.link?.linkedin ?? '';
  late String email = user.email ?? '';
  late String bindlink = user.link?.bindlink ?? '';

  UpdateprofileBloc() : super(UpdateprofileInitial()) {
    imgFuture = convertUriToFile(); // Initialize the Future
    on<UploadImgEvent>((event, emit) async {
      print(user.imageUrl);
      imgFuture = Future.value(event.img); // Wrap the File in a Future
      emit(UpdatedState());
    });

    on<UploadFileEvent>((event, emit) {
      file = event.file;
      emit(UpdatedState());
    });

    on<UpdateAllProfileEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final img = await imgFuture; // Await the image file

        await api.updateProfile(
          token: getIt.get<DataLayer>().authUser!.token,
          firstName: fName,
          lastName: lName,
          linkedin: linkedin,
          github: github,
          bindlink: bindlink,
          img: img?.path ?? '',
          cv: file?.path ?? '',
        );
        emit(SuccessState());
      } on FormatException catch (e) {
        emit(ErrorState(msg: e.message));
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }
    });
  }

  Future<File?> convertUriToFile() async {
    try {
      String uriString =
          user.imageUrl ?? 'https://avatar.iran.liara.run/public';

      // Get the temporary directory
      final directory = await getTemporaryDirectory();

      // Create a file path
      final filePath = '${directory.path}/downloaded_image.png';

      // Download the file
      final response = await http.get(Uri.parse(uriString));

      if (response.statusCode == 200) {
        // Write the bytes to the file
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        print('Failed to download file: ${response.statusCode}');
        return null; 
      }
    } catch (e) {
      print('Error: $e');
      return null; 
    }
  }
}
