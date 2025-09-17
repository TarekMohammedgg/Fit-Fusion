import 'package:fit_fusion/features/authentication/presentation/views/login_screen.dart';
import 'package:fit_fusion/features/authentication/presentation/views/widgets/register_screen.dart';
import 'package:fit_fusion/features/body_info/presentation/view/profile_view.dart';
import 'package:fit_fusion/features/exercise/presentation/views/exercise_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginScreen = '/';
  static const kRegisterScreen = '/Registerscreen';
  static const khomescreen = '/Homeview' ; 
  static const kProfileView = '/ProfileView' ; 

  static final router = GoRouter(
    routes: [
      GoRoute(path: kLoginScreen, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => Registerscreen(),
      ),
      GoRoute(path: khomescreen, builder: (context, state) => ExerciseView()),
      GoRoute(path: kProfileView, builder: (context, state) =>ProfileView()),
    ],
  );
}
