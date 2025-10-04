import 'package:flexlingua_app/presentation/widgets/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const routes = ['/', '/education', '/exercises', '/progress', '/profile'];
    return Scaffold(
      body: const Text('Profile Page'),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 4,
        onTabSelected: (index) {
          if (index != 4) {
            context.go(routes[index]);
          }
        },
      ),
    );
  }
}
