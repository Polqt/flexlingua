import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flexlingua_app/data/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController> controllers = [];
  int selectNavIndex = 0;
  List<String> pages = [
    "Home",
    "Education",
    "Exercises",
    "Progress",
    "Profile",
  ];

  void animateIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(Duration(seconds: 1), () {
      riveIconInputs[index].change(false);
    });
  }

  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );
    artboard.addController(controller!);
    controllers.add(controller);

    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(pages[selectNavIndex])),
      bottomNavigationBar: SafeArea(
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
              final riveIcon = bottomNavItems[index].rive;
              return GestureDetector(
                onTap: () {
                  animateIcon(index);
                  setState(() {
                    selectNavIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(isActive: selectNavIndex == index),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: selectNavIndex == index ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavItems[index].rive.src,
                          artboard: bottomNavItems[index].rive.artboard,
                          onInit: (artboard) {
                            riveOnInit(
                              artboard,
                              stateMachineName: riveIcon.stateMachineName,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
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
