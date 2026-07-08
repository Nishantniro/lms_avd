import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/core/extension/context_extension.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/widgets/custom_text_form.dart';
import 'package:lms_adv/features/course/bloc/create_course/create_course_bloc.dart';
import 'package:lms_adv/features/course/bloc/get_category/get_category_bloc.dart';
import 'package:lms_adv/features/course/model/category_model.dart';
import 'package:lms_adv/features/course/model/course_create_form.dart';
import 'package:lms_adv/features/course/pages/categories/main_category.dart';
//import 'package:lms_adv/features/course/pages/categories/sub_category.dart';

class CreateCourseFormPage extends StatefulWidget {
  const CreateCourseFormPage({super.key});

  @override
  State<CreateCourseFormPage> createState() => _CreateCourseFormPageState();
}

class _CreateCourseFormPageState extends State<CreateCourseFormPage> {
  late final PageController _controller;
  final TextEditingController _titleController = TextEditingController();
  CategoryModel? selectedMainCategory;
  CategoryModel? selectedSubCategory;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<GetCategoryBloc>().add(GetCategoryEvent.getCategory());
    super.didChangeDependencies();
  }

  Widget buildBreadcrumbs() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (selectedMainCategory != null)
            Text(
              selectedMainCategory!.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

          if (selectedSubCategory != null) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.chevron_right, size: 18),
            ),

            Text(
              selectedSubCategory!.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create your course")),

      body: Column(
        crossAxisAlignment: .start,
        children: [
          IconButton(
            onPressed: () {
              final currentPage = _controller.page?.round() ?? 0;
              if (currentPage == 0) return;
              if (currentPage == 1) {
                setState(() {
                  selectedMainCategory = null;
                  selectedSubCategory = null;
                });
              }
              if (currentPage == 2) {
                setState(() {
                  selectedSubCategory = null;
                });
              }
              _controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            icon: Icon(Icons.chevron_left),
          ),
          buildBreadcrumbs(),
          BlocBuilder<GetCategoryBloc, CategoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Center(child: Text("No categories found"));
                },
                loaded: (categories) {
                  if (categories.isEmpty) {
                    return Center(child: Text("No categories found"));
                  }
                  return Expanded(
                    child: PageView(
                      controller: _controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        // child: IconButton(
                        //   onPressed: () {
                        //     _controller.previousPage(
                        //       duration: Duration(milliseconds: 300),
                        //       curve: Curves.easeIn,
                        //     );
                        //   },
                        //   icon: Icon(Icons.chevron_left),
                        // ),
                        //     ),
                        //   ],
                        // ),
                        MainCategory(
                          onSelect: (category) {
                            setState(() {
                              selectedMainCategory = category;
                            });

                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        // selectedMainCategory == null
                        //     ? const Center(
                        //         child: Text("Select a main category"),
                        //       )
                        // : SubCategory(
                        //     parentCategory: selectedMainCategory!,
                        //     onSelect: (category) {
                        //       setState(() {
                        //         selectedSubCategory = category;
                        //       });

                        //       if (category.isLeaf!) {
                        //         _controller.nextPage(
                        //           duration: Duration(milliseconds: 300),
                        //           curve: Curves.easeIn,
                        //         );
                        //       }
                        //     },
                        //   ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          AppText("Course Title", type: AppTextType.label),
          CustomTextForm(controller: _titleController),
          BlocListener<CreateCourseBloc, CourseCreateState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (data) {
                  ContextExtension(context).pop();
                  GoRouterHelper(context).pop();
                },
                loading: () {
                  context.showDialogBox();
                },
              );
            },
            child: AppButton(
              text: "Create Course",
              onPressed: () {
                if (selectedMainCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select a category")),
                  );
                  return;
                }

                final form = CourseCreateForm(
                  title: _titleController.text,
                  categoryId: selectedMainCategory!.id!,
                );

                context.read<CreateCourseBloc>().add(
                  CreateCourseEvent.createCourse(form),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
