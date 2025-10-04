import 'package:flutter/material.dart';

class NavItemModel {
  final String title;
  final IconData icon;

  NavItemModel({required this.title, required this.icon});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(title: 'Home', icon: Icons.home),
  NavItemModel(title: 'Profile', icon: Icons.person),
  NavItemModel(title: 'Education', icon: Icons.school),
  NavItemModel(title: 'Exercises', icon: Icons.fitness_center),
  NavItemModel(title: 'Progress', icon: Icons.bar_chart),
];
