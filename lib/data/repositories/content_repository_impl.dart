import 'package:flexlingua_app/data/sources/local/content_local_data_source.dart';
import 'package:flexlingua_app/data/sources/remote/content_remote_data_source.dart';
import 'package:flexlingua_app/domain/entities/educational_content.dart';
import 'package:flexlingua_app/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  final ContentRemoteDataSource _remoteDataSource;
  final ContentLocalDataSource _localDataSource;

  ContentRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<EducationalContent>> getAllContent() async {
    try {
      final content = await _remoteDataSource.getAllContent();
      await _localDataSource.cacheContent(content); // Cache for offline access
      return content;
    } catch (e) {
      return await _localDataSource.getCachedContent();
    }
  }

  @override
  Future<List<EducationalContent>> getContentByCategory(String category) async {
    try {
      return await _remoteDataSource.getContentByCategory(category);
    } catch (e) {
      final cached = await _localDataSource.getCachedContent();
      return cached.where((item) => item.category == category).toList();
    }
  }

  @override
  Future<List<EducationalContent>> searchContent(String searchTerm) async {
    try {
      final allContent = await getAllContent();
      return allContent
          .where((item) => item.matchesSearch(searchTerm))
          .toList();
    } catch (e) {
      final cached = await _localDataSource.getCachedContent();
      return cached.where((item) => item.matchesSearch(searchTerm)).toList();
    }
  }

  @override
  Future<EducationalContent?> getContentById(String id) async {
    try {
      return await _remoteDataSource.getContentById(id);
    } catch (e) {
      final cached = await _localDataSource.getCachedContent();
      return cached.firstWhere((item) => item.id == id);
    }
  }
}
