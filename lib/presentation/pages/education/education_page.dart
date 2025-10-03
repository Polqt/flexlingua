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
    const routes = ['/', '/education', '/exercises', '/progress'];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigation(
          currentIndex: 0,
          onTabSelected: (index) => context.go(routes[index]),
        ),
      ),
    );
  }
}
