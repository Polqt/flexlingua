import 'package:flexlingua_app/presentation/widgets/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    const routes = ['/', '/education', '/exercises', '/progress'];
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
        onTabSelected: (index) => context.go(routes[index]),
      ),
    );
  }
}
