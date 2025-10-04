import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexlingua_app/data/models/exercise_model.dart';
import 'package:flexlingua_app/domain/entities/exercise.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<Exercise>> getAllExercises();
  Future<List<Exercise>> getExercisesByCategory(String category);
  Future<Exercise?> getExerciseById(String id);
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final FirebaseFirestore _firestore;

  ExerciseRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<Exercise>> getAllExercises() async {
    final snapshot = await _firestore.collection('exercises').get();
    return snapshot.docs
        .map((doc) => ExerciseModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<Exercise>> getExercisesByCategory(String category) async {
    final snapshot = await _firestore
        .collection('exercises')
        .where('category', isEqualTo: category)
        .get();
    return snapshot.docs
        .map((doc) => ExerciseModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final doc = await _firestore.collection('exercises').doc(id).get();
    if (doc.exists) {
      return ExerciseModel.fromJson(doc.data()!);
    }
    return null;
  }
}
