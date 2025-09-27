import 'package:flexlingua_app/presentation/pages/exercises/exercises_page.dart';
import 'package:flexlingua_app/presentation/pages/progress/progress_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flexlingua_app/presentation/pages/home/home_page.dart';
import 'package:flexlingua_app/presentation/pages/education/education_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
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
    ],
  );
});
