import 'dart:async';
import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flexlingua_app/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();

    _timer = Timer(const Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() async {
    await _fadeController.reverse();
    if (mounted) {
      final authState = ref.read(authStateProvider);
      if (authState.value != null) {
        context.go('/');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Lottie.network(
            "https://lottie.host/4c12391e-e720-45b3-9eb2-5fcb0f25a66e/OJ7mmHIeR0.json",
            fit: BoxFit.cover,
            width: 300,
            height: 300,
            frameRate: FrameRate.max,
            repeat: true,
            animate: true,
            alignment: Alignment.center,
            options: LottieOptions(enableMergePaths: true),
          ),
        ),
      ),
    );
  }
}
