part of 'create_course_bloc.dart';

@freezed
abstract class CreateCourseEvent with _$CreateCourseEvent {
  const factory CreateCourseEvent.createCourse(CourseCreateForm form) =
      _CreateCourse;
}
