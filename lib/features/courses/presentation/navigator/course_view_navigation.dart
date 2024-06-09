import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/courses/presentation/view/add_course_view.dart';

final loginViewNavigatorProvider = Provider((ref)=> CourseViewNavigator());

class CourseViewNavigator{}

mixin CourseViewRoute {
  openBatchView(){
    NavigateRoute.popAndPushRoute(const AddCourseView());
  }
}