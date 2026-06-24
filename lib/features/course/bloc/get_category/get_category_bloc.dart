import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/course/model/category_model.dart';
import 'package:lms_adv/features/course/repositories/category_repo.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';
part 'get_category_bloc.freezed.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, CategoryState> {
  final CategoryRepoI _categoryRepoI;
  GetCategoryBloc({required this._categoryRepoI})
    : super(CategoryState.initial()) {
    on<_GetCategory>(_getCategory);
  }
  void _getCategory(_GetCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryState.loading());
    final result = await _categoryRepoI.getCategories();
    result.fold(
      (l) => emit(CategoryState.failure(l)),
      (r) => emit(CategoryState.loaded(r)),
    );
  }
}
