import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/base_state/base.dart';
import 'package:lms_adv/features/course/model/get_course_model.dart';
import 'package:lms_adv/features/course/repositories/course_repo.dart';

part 'get_course_event.dart';
part 'get_course_state.dart';
part 'get_course_bloc.freezed.dart';

class GetCourseBloc extends Bloc<GetCourseEvent, GetCourseState> {
  final CourseRepository _courseRepository;
  GetCourseBloc({ required this._courseRepository})
    : super(GetCourseState.initial()) {
    on<_GetCourses>(_getCourses);
  }
  Future<void> _getCourses(
    _GetCourses event,
    Emitter<GetCourseState> emit,
  ) async {
    emit(GetCourseState.loading());
    final result = await _courseRepository.getCourses();

    result.fold(
      (l) => emit(GetCourseState.failure(l)),
      (r) => emit(GetCourseState.loaded(r)),
    );
  }
}
