import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';
import 'package:lms_adv/features/course/model/course_create_form.dart';

abstract class CourseRepository {
  FutureEither<String> createCourse(CourseCreateForm form);
}

class CourseRepositoryImpl implements CourseRepository {
  final ApiServices _apiService;

  CourseRepositoryImpl({required this._apiService});

  @override
  FutureEither<String> createCourse(CourseCreateForm form) async {
    return await _apiService.post(
      "courses/",
      data: form.toMap(),
      fromJson: (map) {
        return "Course created successfully";
      },
    );
  }
}
