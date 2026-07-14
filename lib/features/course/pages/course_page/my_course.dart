import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_adv/core/bloc/base_state/base.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/features/course/bloc/get_course_me/get_course_me_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<GetCourseMeBloc>().add(GetCourseMeEvent.getCourseMe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Courses")),
      body: BlocBuilder<GetCourseMeBloc, GetCourseMeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.red,
                rightDotColor: Colors.cyanAccent,
                size: 60,
              ),
            ),

            failure: (failure) => Center(child: AppText(failure.message)),

            loaded: (response) {
              final courses = response.results;

              if (courses.isEmpty) {
                return const Center(child: Text("No courses found"));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: courses.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final course = courses[index];

                  return Card(
                    child: ListTile(
                      leading:
                          course.thumbnail == null || course.thumbnail!.isEmpty
                          ? const Icon(Icons.image_not_supported)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                course.thumbnail!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                      title: AppText(course.title, type: AppTextType.label),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Slug: ${course.slug}"),
                          AppText("Status: ${course.status}"),
                        ],
                      ),
                    ),
                  );
                },
              );
            },

            orElse: () => Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.red,
                rightDotColor: Colors.cyanAccent,
                size: 60,
              ),
            ),
          );
        },
      ),
    );
  }
}
