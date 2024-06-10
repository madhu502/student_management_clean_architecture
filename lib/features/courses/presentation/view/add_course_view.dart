import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/courses/presentation/viewmodel/course_view_model.dart';

class AddCourseView extends ConsumerStatefulWidget {
  const AddCourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends ConsumerState<AddCourseView> {
  final courseController = TextEditingController();
  var gap = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Course',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Course Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(courseViewModelProvider.notifier).addCourse(
                        CourseEntity(courseName: courseController.text));
                  },
                  child: const Text('Add Course'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              gap,
              //Display List of Courses
              if (courseState.isLoading) ...{
                const Center(child: CircularProgressIndicator()),
              } else if (courseState.error != null) ...{
                Text(courseState.error.toString()),
              } else if (courseState.lstCourses.isEmpty) ...{
                const Center(
                  child: Text('No Courses'),
                )
              } else ...{
                Expanded(
                  child: ListView.builder(
                    itemCount: courseState.lstCourses.length,
                    itemBuilder: (context, index) {
                      var course = courseState.lstCourses[index];
                      return ListTile(
                        title: Text(course.courseName),
                        subtitle: Text(course.courseId ?? ''),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete), onPressed: () {}),
                      );
                    },
                  ),
                )
              },
            ],
          ),
        ),
      ),
    );
  }
}
