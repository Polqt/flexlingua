import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flexlingua_app/data/models/nav_item_model.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int) onTabSelected;
  final int currentIndex;
  const BottomNavigation({
    super.key,
    required this.onTabSelected,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryDark.withValues(alpha: .8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withValues(alpha: 0.4),
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavItems.length, (index) {
            final isSelected = widget.currentIndex == index;
            return GestureDetector(
              onTap: () {
                widget.onTabSelected(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: widget.currentIndex == index),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: widget.currentIndex == index ? 1 : 0.5,
                      child: Icon(
                        bottomNavItems[index].icon,
                        color: isSelected
                            ? AppColors.background
                            : AppColors.background.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
