// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      instructions: json['instructions'] as String,
      category: json['category'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      repetitions: (json['repetitions'] as num).toInt(),
      difficultyLevel: json['difficultyLevel'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'instructions': instance.instructions,
      'category': instance.category,
      'durationSeconds': instance.durationSeconds,
      'repetitions': instance.repetitions,
      'difficultyLevel': instance.difficultyLevel,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
