import 'package:get/get.dart';

import '../modules/doRoutine/bindings/do_routine_binding.dart';
import '../modules/doRoutine/views/do_routine_view.dart';
import '../modules/gender/bindings/gender_binding.dart';
import '../modules/gender/views/gender_view.dart';
import '../modules/goal/bindings/goal_binding.dart';
import '../modules/goal/views/goal_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/password/bindings/password_binding.dart';
import '../modules/password/views/password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.GENDER,
      page: () => GenderView(),
      binding: GenderBinding(),
    ),
    GetPage(
      name: _Paths.GOAL,
      page: () => GoalView(),
      binding: GoalBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD,
      page: () => PasswordView(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: _Paths.DO_ROUTINE,
      page: () => DoRoutineView(),
      binding: DoRoutineBinding(),
    ),
  ];
}
