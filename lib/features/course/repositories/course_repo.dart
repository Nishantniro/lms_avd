import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';
import 'package:lms_adv/features/course/model/course_create_form.dart';
import 'package:lms_adv/features/course/model/get_course_model.dart';

abstract class CourseRepository {
  FutureEither<String> createCourse(CourseCreateForm form);
  FutureEither<GetCourseResponseModel> getCourses();
}

class CourseRepositoryImpl implements CourseRepository {
  final ApiServices _apiService;

  CourseRepositoryImpl({required this._apiService});

  @override
  FutureEither<String> createCourse(CourseCreateForm form) async {
    return await _apiService.post(
      "/courses/",
      data: form.toMap(),
      fromJson: (map) {
        return "Course created successfully";
      },
    );
  }

  @override
  FutureEither<GetCourseResponseModel> getCourses({
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _apiService.get(
      "/courses/",
      queryParameters: queryParameters,

      fromJson: (map) => GetCourseResponseModel.fromMap(map),
    );
  }
}
