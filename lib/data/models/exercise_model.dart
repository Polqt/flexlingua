import 'package:flexlingua_app/domain/entities/exercise.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.instructions,
    required super.category,
    required super.durationSeconds,
    required super.repetitions,
    required super.difficultyLevel,
    required super.tags,
    required super.createdAt,
    super.isCompleted,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  factory ExerciseModel.fromEntity(Exercise entity) {
    return ExerciseModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      instructions: entity.instructions,
      category: entity.category,
      durationSeconds: entity.durationSeconds,
      repetitions: entity.repetitions,
      difficultyLevel: entity.difficultyLevel,
      tags: entity.tags,
      createdAt: entity.createdAt,
      isCompleted: entity.isCompleted,
    );
  }
}
