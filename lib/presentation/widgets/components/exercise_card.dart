import 'package:flexlingua_app/core/constants/app_colors.dart';
import 'package:flexlingua_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String name;
  final String description;
  final String duration;
  final VoidCallback onStart;
  final bool isCompleted;
  final double? progress;

  const ExerciseCard({
    super.key,
    required this.name,
    required this.description,
    required this.duration,
    required this.onStart,
    this.isCompleted = false,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (isCompleted)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Chip(
                      label: Text(
                        duration,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: AppColors.primaryLight.withValues(
                        alpha: 0.2,
                      ),
                      labelStyle: const TextStyle(color: AppColors.textPrimary),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                if (progress != null) ...[
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.surfaceVariant,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(progress! * 100).toInt()}% complete',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onStart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(isCompleted ? 'Revisit' : 'Start'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
