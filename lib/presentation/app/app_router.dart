import 'package:flexlingua_app/presentation/pages/auth/login_page.dart';
import 'package:flexlingua_app/presentation/pages/auth/signup_page.dart';
import 'package:flexlingua_app/presentation/pages/exercises/exercises_page.dart';
import 'package:flexlingua_app/presentation/pages/progress/progress_page.dart';
import 'package:flexlingua_app/presentation/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flexlingua_app/presentation/pages/home/home_page.dart';
import 'package:flexlingua_app/presentation/pages/education/education_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    onException: (_, GoRouterState state, GoRouter router) {
      router.go('/404', extra: state.uri.toString());
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/education',
        builder: (context, state) => const EducationPage(),
      ),
      GoRoute(
        path: '/exercises',
        builder: (context, state) => const ExercisesPage(),
      ),
      GoRoute(
        path: '/progress',
        builder: (context, state) => const ProgressPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    ],
  );
});
