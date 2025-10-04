import 'package:flexlingua_app/data/sources/local/exercise_local_data_source.dart';
import 'package:flexlingua_app/data/sources/remote/exercise_remote_data_source.dart';
import 'package:flexlingua_app/domain/entities/exercise.dart';
import 'package:flexlingua_app/domain/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource _remoteDataSource;
  final ExerciseLocalDataSource _localDataSource;

  ExerciseRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<Exercise>> getAllExercises() async {
    try {
      final exercises = await _remoteDataSource.getAllExercises();
      await _localDataSource.cacheExercises(exercises);
      return exercises;
    } catch (e) {
      return await _localDataSource.getCachedExercises();
    }
  }

  @override
  Future<List<Exercise>> getExercisesByCategory(String category) async {
    try {
      return await _remoteDataSource.getExercisesByCategory(category);
    } catch (e) {
      final cached = await _localDataSource.getCachedExercises();
      return cached.where((e) => e.category == category).toList();
    }
  }

  @override
  Future<List<Exercise>> getExercisesByDifficulty(
    String difficultyLevel,
  ) async {
    try {
      final allExercises = await getAllExercises();
      return allExercises
          .where((e) => e.difficultyLevel == difficultyLevel)
          .toList();
    } catch (e) {
      final cached = await _localDataSource.getCachedExercises();
      return cached.where((e) => e.difficultyLevel == difficultyLevel).toList();
    }
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    try {
      return await _remoteDataSource.getExerciseById(id);
    } catch (e) {
      final cached = await _localDataSource.getCachedExercises();
      return cached.firstWhere((e) => e.id == id);
    }
  }

  @override
  Future<List<Exercise>> searchExercises(String query) async {
    final exercises = await getAllExercises();
    final searchTerm = query.toLowerCase();

    return exercises.where((exercise) {
      final titleMatch = exercise.title.toLowerCase().contains(searchTerm);
      final descriptionMatch =
          exercise.description.toLowerCase().contains(searchTerm) ||
          exercise.title.toLowerCase().contains(searchTerm) ||
          exercise.tags.any((tag) => tag.toLowerCase().contains(searchTerm));
      return titleMatch || descriptionMatch;
    }).toList();
  }

  @override
  Future<void> markExerciseCompleted(String exerciseId, String userId) async {
    await _localDataSource.saveCompletedExerciseId(exerciseId, userId);
  }

  @override
  Future<List<Exercise>> getCompletedExercises(String userId) async {
    final completedIds = await _localDataSource.getCompletedExerciseIds(userId);
    final allExercises = await getAllExercises();
    return allExercises.where((e) => completedIds.contains(e.id)).toList();
  }
}
