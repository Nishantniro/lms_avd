
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';
import 'package:lms_adv/features/course/model/category_model.dart';

abstract class CategoryRepoI {
  FutureEither<List<CategoryModel>> getCategories();
  FutureEither<List<CategoryModel>> getCategoryTree();
  FutureEither<CategoryModel> getCategoryDetail(String slug);
}

class CategoryRepoImpl implements CategoryRepoI {
  final ApiServices apiServices;

  CategoryRepoImpl({required this.apiServices});

  @override
  FutureEither<List<CategoryModel>> getCategories() async {
    return await apiServices.get(
      "/courses/categories/",
      fromJson: (categories) {
        return List.from(
          categories,
        ).map((e) => CategoryModel.fromMap(e)).toList();
      },
    );
  }

  @override
  FutureEither<CategoryModel> getCategoryDetail(String slug) async {
    return await apiServices.get(
      "/courses/categories/$slug",
      fromJson: (categories) {
        return CategoryModel.fromMap(categories);
      },
    );
  }

  @override
  FutureEither<List<CategoryModel>> getCategoryTree() async {
    return await apiServices.get(
      "/courses/categories/tree/",
      fromJson: (categories) {
        return List.from(
          categories,
        ).map((e) => CategoryModel.fromMap(e)).toList();
      },
    );
  }
}
