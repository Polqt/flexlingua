import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flexlingua_app/presentation/pages/home/home_page.dart';
import 'package:flexlingua_app/presentation/pages/education/education_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/education',
        builder: (context, state) => const EducationPage(),
      ),
    ],
  );
});
