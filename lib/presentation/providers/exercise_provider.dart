import 'package:flexlingua_app/domain/entities/exercise.dart';
import 'package:flexlingua_app/domain/repositories/exercise_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final exerciseRepositoryProvider = Provider<ExerciseRepository>((ref) {
  throw UnimplementedError();
});

final exerciseProvider =
    StateNotifierProvider<ExerciseNotifier, AsyncValue<List<Exercise>>>((ref) {
      final repo = ref.watch(exerciseRepositoryProvider);
      return ExerciseNotifier(repo);
    });

class ExerciseNotifier extends StateNotifier<AsyncValue<List<Exercise>>> {
  final ExerciseRepository _repository;

  ExerciseNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadExercises();
  }

  Future<void> loadExercises() async {
    state = const AsyncValue.loading();
    try {
      final exercises = await _repository.getAllExercises();
      state = AsyncValue.data(exercises);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> loadExercisesByCategory(String category) async {
    state = const AsyncValue.loading();
    try {
      final exercises = await _repository.getExercisesByCategory(category);
      state = AsyncValue.data(exercises);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> searchExercises(String query) async {
    if (query.isEmpty || query == '') {
      loadExercises();
      return;
    }

    state = const AsyncValue.loading();
    try {
      final exercises = await _repository.searchExercises(query);
      state = AsyncValue.data(exercises);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> markCompleted(String exerciseId, String userId) async {
    await _repository.markExerciseCompleted(exerciseId, userId);
    await loadExercises();
  }
}
