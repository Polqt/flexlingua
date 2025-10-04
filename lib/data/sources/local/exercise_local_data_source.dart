import 'dart:convert';

import 'package:flexlingua_app/data/models/exercise_model.dart';
import 'package:flexlingua_app/domain/entities/exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ExerciseLocalDataSource {
  Future<List<Exercise>> getCachedExercises();
  Future<void> cacheExercises(List<Exercise> exercises);
  Future<List<String>> getCompletedExerciseIds(String userId);
  Future<void> saveCompletedExerciseId(String exerciseId, String userId);
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final SharedPreferences _prefs;
  static const String _exercisesKey = 'cached_exercises';

  ExerciseLocalDataSourceImpl(this._prefs);

  @override
  Future<List<Exercise>> getCachedExercises() async {
    final cached = _prefs.getString(_exercisesKey);
    if (cached != null) {
      final List<dynamic> jsonList = json.decode(cached);
      return jsonList.map((json) => ExerciseModel.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<void> cacheExercises(List<Exercise> exercises) async {
    final jsonList = exercises
        .map((e) => (e as ExerciseModel).toJson())
        .toList();
    await _prefs.setString(_exercisesKey, json.encode(jsonList));
  }

  @override
  Future<List<String>> getCompletedExerciseIds(String userId) async {
    final key = 'completed_exercises_$userId';
    final completed = _prefs.getStringList(key) ?? [];
    return completed;
  }

  @override
  Future<void> saveCompletedExerciseId(String exerciseId, String userId) async {
    final key = 'completed_exercises_$userId';
    final current = await getCompletedExerciseIds(userId);
    if (!current.contains(exerciseId)) {
      current.add(exerciseId);
      await _prefs.setStringList(key, current);
    }
  }
}
