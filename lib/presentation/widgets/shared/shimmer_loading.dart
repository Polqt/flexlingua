import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShimmerLoading extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final double? size;

  const ShimmerLoading({
    super.key,
    this.size,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseColor ?? AppColors.secondaryDark,
      child: Center(
        child: SpinKitSpinningLines(
          color: highlightColor ?? AppColors.secondaryLight,
          size: size ?? 50.0,
        ),
      ),
    );
  }
}
