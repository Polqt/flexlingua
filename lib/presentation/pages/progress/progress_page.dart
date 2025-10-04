import 'package:flexlingua_app/presentation/widgets/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    const routes = ['/', '/education', '/exercises', '/progress', '/profile'];
    return SafeArea(
      child: Scaffold(
        body: const Text('Progress Page'),
        bottomNavigationBar: BottomNavigation(
          currentIndex: 3,
          onTabSelected: (index) {
          if (index != 3) {
            context.go(routes[index]);
          }
        },
        ),
      ),
    );
  }
}
