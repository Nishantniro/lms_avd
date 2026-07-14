
class GetCourseResponseModelMe {
  final int count;
  final String? next;
  final String? previous;
  final List<CourseModelMe> results;

  GetCourseResponseModelMe({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory GetCourseResponseModelMe.fromMap(Map<String, dynamic> map) {
    return GetCourseResponseModelMe(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<CourseModelMe>.from(
        (map['results'] as List).map(
          (e) => CourseModelMe.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((e) => e.toMap()).toList(),
    };
  }
}

class CourseModelMe {
  final String id;
  final String title;
  final String slug;
  final String? thumbnail;
  final String status;

  const CourseModelMe({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnail,
    required this.status,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
      'thumbnail': thumbnail,
      'status': status,
    };
  }

  factory CourseModelMe.fromMap(Map<String, dynamic> map) {
    return CourseModelMe(
      id: map['id'] as String,
      title: map['title'] as String,
      slug: map['slug'] as String,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      status: map['status'] as String,
    );
  }


}
