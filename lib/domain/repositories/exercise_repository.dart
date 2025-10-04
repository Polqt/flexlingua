import 'package:flexlingua_app/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getAllExercises();
  Future<List<Exercise>> getExercisesByCategory(String category);
  Future<List<Exercise>> getExercisesByDifficulty(String difficultyLevel);
  Future<Exercise?> getExerciseById(String id);
  Future<List<Exercise>> searchExercises(String query);

  Future<void> markExerciseCompleted(String exerciseId, String userId);
  Future<List<Exercise>> getCompletedExercises(String userId);
}