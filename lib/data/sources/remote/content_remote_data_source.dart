import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexlingua_app/data/models/educational_content_model.dart';
import 'package:flexlingua_app/domain/entities/educational_content.dart';

abstract class ContentRemoteDataSource {
  Future<List<EducationalContent>> getAllContent();
  Future<List<EducationalContent>> getContentByCategory(String category);
  Future<EducationalContent?> getContentById(String id);
}

class ContentRemoteDataSourceImpl implements ContentRemoteDataSource {
  final FirebaseFirestore _firestore;

  ContentRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<EducationalContent>> getAllContent() async {
    final snapshot = await _firestore.collection('educational_content').get();
    return snapshot.docs
        .map((doc) => EducationalContentModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<EducationalContent>> getContentByCategory(String category) async {
    final snapshot = await _firestore
        .collection('educational_content')
        .where('category', isEqualTo: category)
        .get();
    return snapshot.docs
        .map((doc) => EducationalContentModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<EducationalContent?> getContentById(String id) async {
    final doc = await _firestore
        .collection('educational_content')
        .doc(id)
        .get();
    if (doc.exists) {
      return EducationalContentModel.fromJson(doc.data()!);
    }

    return null;
  }
}
