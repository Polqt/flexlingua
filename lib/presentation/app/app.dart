import 'package:flexlingua_app/core/themes/app_theme.dart';
import 'package:flexlingua_app/presentation/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Flexlingua',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
