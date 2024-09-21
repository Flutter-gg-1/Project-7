import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final api = NetworkingApi();
  TextEditingController noteController = TextEditingController();
  double idea = 2,
      design = 2,
      tools = 2,
      practices = 2,
      presentation = 2,
      investment = 2;
  RatingBloc() : super(RatingInitial()) {
    on<RatingEvent>((event, emit) {});
    on<CompleteRatingEvent>((event, emit) async {
      try {
        emit(LoadingState());
        await api.ratingProject(
            userToken:
                'NjliNDlmMTE3N2M1MTZmNDcwZDAzMzliNzVmMGZjNjExNzhmZjJmMzg1NjRkYjkyZTA5NzY3ZmM3ODE4MDNiZTE0YTM2NzYyYmNkOThmN2ExMjIxYjRlYTc3OGJiNjc0N2RhZjc1ODRhOTM2NjNlZTM3MGEwYjAxYzYxN2MwNThiZThlZjRmZGQ4M2EwMDRhY2FhNmU2NTM1OGY1ZTNiODk4OWQ4NmMzYTRmMmU1YzQ2NWY1YjFmMDUxZWY4ZTEwMzkxNmE2OWFmNDkzOTlmMjA5ZGNmYjk4YzViZTAxZjcxZWU5NGQ0ZTNiMjdmNmRkZWQ2NTQwZjgxMGZlZTQ3Mjk3ODAzZjliNDNjNTgzNTU2OGIzMDliYzM5YTJkNDRmZGU5MTliYTQyMzAzOGU4ZTQ5NTJlYWQ3NTEzYTRmMmUzOGYzZjZkMGVlN2NiYzhhZGVhNzRmZDEzNzdiMDE4NjU1ZjgyYWIyNGMwZWEyZWNjZDdlMGU3NmEzYTBlNWI4NWUwZTExYTU1NTQzNDIzMzlhNzA3NmUzZTUzOWNmY2M4NDdjMWM3YTVjNTQ2OGY1MWQ4YjkzNTA0ZTUxYWE5NWQ0ZWE5YjM1Y2IyMGI0MjY1NzBlMDM1MGIzZmI5MGEzOWQ2OWUzYzRmY2Q1ZTg1OWEzNDcwNjZjN2RiMDZlZjNmMzdhNmJmNTM4YzA5OTI1NjhlMzhkNDdjYjA1NjQxMThmZmYwZjhlNDg3Mzc4ZmZkNzNhYTZlYTgzMGE1OThiZDAzYzU4ODQzNzI3MDlmYjdiNDBlZjc2OTk4ZjUyNTVmOTlhZDVhZmRiYjdmYTVhODM4N2RmZTBlNGEwYTc1YjhjODE1MmUwMGRmMTY0MjI4OTM2OGMzZDViNWE0MzYyMDE5ODI1ODZlZDc2YjdkYTQ5YjhlMWVjMWI4Mzk3ODEwM2QyZjIzZTE2Mzg2ZWIyNGFkMTRkNWZjYTM1NGQ3OGEyZjJkYzkyOWQwNTUyNzA4YjMwODU5YzVmYmFlZjlkMDAxODVhZDBmMmI0NmJlZmM1MzAwY2U4MGQxZmU0Y2M3NWI0OGIzY2Y1NWU4MjNiODA1NzY3ODA0MWQ3MWFiY2M2M2M4MDY1YWVhYTk4MzRlZTU0YjIxYWE5ZmMwNDc4YzI2N2FmYTBkOGM5ZTA2ZjY1NWJiYzA2MzJhYWEzMWU1YzFjMzI4MmQwNDk5NjZjNmZhNWE0Y2ZmY2NjZWJhOWJiZmRhNDIwNDZkNzAwMDVhZDU2Mjg2ZGIzMTcxNGIwYTUwZTE5Zjg2YTRiODc3ZTQzNGU2ZTc4MzJlOTUxYTk3NDQwNDQyZDYzODA3OWYwNDk5ZDRjMTc1YzgyMTU3ZmIzNTkyYzlmZGI0OTFjNGE5YTQ0ZDI3ODdjYTEyYzI0MmE0ZDAzMzhjMDQ1MWNmMjVmZDg4Y2Q5MWJhMjczODY5NTBlMGU2NmMyMDk5NTg3MGE2MTI3OWJiM2JiYTJlNDRmZmRmNmEzNjNlZjhiNGJiMWY3OWY5YjQ0MjA2YjRhOGEzYjY5ODAwNmVhM2UwZDFhMmM2ODYzMzRhZTg3ZmE2Y2NmMzFlN2I2YmE1YTExNjdmZTQ5MTcwM2M5MTc0MWIxMzE2YTA5NmY5MWY5ZjU4OTA4MzYyNGVmYmE3OTBlZWM1NmMzMjU5ZjllOTdkM2VmOGYyMTYwYzVhZmExYmVkN2I0NTk1NjZiMjI2OWEzYjNmMzM1YzdkYjNhY2RlMzVhZTMxZTkwMjI5MzVmYTc1NTZmYTRmNDEzZmZlOGVjYjZkOWE2ZWFkNzc4M2ViMGE2NjcyOTdlNWQ3NzQ1ZjExMTMzMzU5Zjg1OTdkYWQ3YTRhZjFkNzkyOTJiYzVjZWEzZTFhMWQ5MWRmODMzNzQyMzFjNzA4NGU5NWIzNzU0MzRlZmYxNWFjMDA0OTE5YWJmOWZkNTdkMjMxOGFhYTdiNGMyZjYwMTRiOTc5NDc3ZjVkNWE2MDdkZGUzMTFlMzJlYTI0ZjA4MWJhM2NiNDY1NDAxZWI2MzBhMmU4NzZjYjIzZGNjNzFlMWU1YWRkYjZlZTNkNDhjYTZkZGFkNzZkYWI1N2I0MDI2NmU0ZDNlNGMwMTQ5ZjJjYWE3ZjkyMTc0MjdiZjc0MDFlZjk1ZjQ2NGUzMjk4NjNhYzdiNDM5Y2MzYzkxNGRjMTg5NjQ4ZWQ3OTA5MDIxNGEwYzEx',
            projectId: event.projectId,
            note: noteController.text.trim(),
            idea: idea,
            design: design,
            tools: tools,
            practices: practices,
            presentation: presentation,
            investment: investment);
        emit(SucsessState(msg: 'Thank you'));
        noteController.clear();
      } on DioException catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
  }
}
