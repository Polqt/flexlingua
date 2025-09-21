import 'package:flexlingua_app/domain/entities/educational_content.dart';

abstract class ContentRepository {
  Future<List<EducationalContent>> getAllContent();

  Future<List<EducationalContent>> getContentByCategory(String category);

  Future<List<EducationalContent>> searchContent(String searchTerm);

  Future<EducationalContent?> getContentById(String id);
}
