
import 'package:fit_fusion/features/authentication/presentation/views/login_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginScreen = '/';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) =>  LoginScreen(),
      ),

    ],
  );
}
