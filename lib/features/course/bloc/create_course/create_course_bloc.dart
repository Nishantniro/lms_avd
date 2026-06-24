import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/course/model/course_create_form.dart';
import 'package:lms_adv/features/course/repositories/course_repo.dart';

part 'create_course_event.dart';
part 'create_course_state.dart';
part 'create_course_bloc.freezed.dart';

class CreateCourseBloc extends Bloc<CreateCourseEvent, CourseCreateState> {
  final CourseRepository courseRepository;
  CreateCourseBloc({required this.courseRepository})
    : super(CourseCreateState.initial()) {
    on<_CreateCourse>(_createCourse);
  }
  void _createCourse(
    _CreateCourse event,
    Emitter<CourseCreateState> emit,
  ) async {
    emit(CourseCreateState.loading());
    final result = await courseRepository.createCourse(event.form);
    result.fold(
      (l) => emit(CourseCreateState.failure(l)),
      (r) => emit(CourseCreateState.loaded(r)),
    );
  }
}
