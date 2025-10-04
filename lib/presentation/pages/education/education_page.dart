import 'package:flutter/material.dart';
import 'package:flexlingua_app/presentation/widgets/common/bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    const routes = ['/', '/education', '/exercises', '/progress', '/profile'];
    return SafeArea(
      child: Scaffold(
        body: const Text('Education Page'),
        bottomNavigationBar: BottomNavigation(
          currentIndex: 1,
          onTabSelected: (index) {
            if (index != 1) {
              context.go(routes[index]);
            }
          },
        ),
      ),
    );
  }
}
