import 'package:flexlingua_app/presentation/pages/auth/login_page.dart';
import 'package:flexlingua_app/presentation/pages/auth/signup_page.dart';
import 'package:flexlingua_app/presentation/pages/exercises/exercises_page.dart';
import 'package:flexlingua_app/presentation/pages/progress/progress_page.dart';
import 'package:flexlingua_app/presentation/providers/auth_provider.dart';
import 'package:flexlingua_app/presentation/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flexlingua_app/presentation/pages/home/home_page.dart';
import 'package:flexlingua_app/presentation/pages/education/education_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    onException: (_, GoRouterState state, GoRouter router) {
      router.go('/404', extra: state.uri.toString());
    },
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isAuthRoute =
          state.uri.toString() == '/login' ||
          state.uri.toString() == '/signup' ||
          state.uri.toString() == '/splash';

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }

      if (isLoggedIn && isAuthRoute) {
        return '/';
      }

      return null;
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
