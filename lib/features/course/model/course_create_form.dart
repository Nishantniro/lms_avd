class CourseCreateForm {
  final String title;
  final String categoryId;
  CourseCreateForm({required this.title, required this.categoryId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'category': categoryId};
  }
}
