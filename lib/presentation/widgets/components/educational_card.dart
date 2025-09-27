import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flexlingua_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class EducationalCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color categoryColor;
  final VoidCallback onTap;
  final bool isCompleted;

  const EducationalCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.categoryColor,
    required this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            gradient: LinearGradient(
              colors: [
                categoryColor.withValues(alpha: 0.1),
                categoryColor.withValues(alpha: 0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: categoryColor,
                      size: AppSizes.iconSize,
                    ),
                  ),
                  const Spacer(),
                  if (isCompleted)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSizes.spacing),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
