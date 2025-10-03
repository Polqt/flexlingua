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
