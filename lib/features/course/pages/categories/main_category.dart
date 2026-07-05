import 'package:flutter/material.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/course/bloc/get_category/get_category_bloc.dart';
import 'package:lms_adv/features/course/model/category_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainCategory extends StatelessWidget {
  final Function(CategoryModel) onSelect;

  const MainCategory({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: Colors.black,
                rightDotColor: Colors.purpleAccent,
                size: 30,
              ),
            );
          },
          loaded: (categoryModel){
              return ListView.builder(
            itemCount: categoryModel.length,
            itemBuilder: (context, index) {
              final category = categoryModel[index];

              return ListTile(
                title: Text(category.name),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  onSelect(category);
                },
              );
            },
          );
            
          }
          
        );
        

        // return Center();
      },
    );
  }
}
