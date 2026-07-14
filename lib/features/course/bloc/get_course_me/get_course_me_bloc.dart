import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/base_state/base.dart';
import 'package:lms_adv/features/course/model/get_course_me_model.dart';
import 'package:lms_adv/features/course/repositories/course_repo.dart';

part 'get_course_me_event.dart';
part 'get_course_me_state.dart';
part 'get_course_me_bloc.freezed.dart';

class GetCourseMeBloc extends Bloc<GetCourseMeEvent, GetCourseMeState> {
  final CourseRepository _courseRepository;

  GetCourseMeBloc({required this._courseRepository})
    : super(GetCourseMeState.initial()) {
    on<_GetCourseMe>(_getCourseMe);
  }

  Future<void> _getCourseMe(
    _GetCourseMe event,
    Emitter<GetCourseMeState> emit,
  ) async {
    emit(GetCourseMeState.loading());
    final result = await _courseRepository.getCoursesMe();
    result.fold(
      (l) => emit(GetCourseMeState.failure(l)),
      (r) => emit(GetCourseMeState.loaded(r)),
    );
  }
}
