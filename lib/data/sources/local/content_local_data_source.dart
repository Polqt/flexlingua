import 'dart:convert';

import 'package:flexlingua_app/data/models/educational_content_model.dart';
import 'package:flexlingua_app/domain/entities/educational_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContentLocalDataSource {
  Future<List<EducationalContent>> getCachedContent();
  Future<void> cacheContent(List<EducationalContent> content);
}

class ContentLocalDataSourceImpl implements ContentLocalDataSource {
  final SharedPreferences _prefs;
  static const String _contentKey = 'cached_content';

  ContentLocalDataSourceImpl(this._prefs);

  @override
  Future<List<EducationalContent>> getCachedContent() async {
    final cached = _prefs.getString(_contentKey);
    if (cached != null) {
      final List<dynamic> jsonList = json.decode(cached);
      return jsonList
          .map((json) => EducationalContentModel.fromJson(json))
          .toList();
    }
    return [];
  }

  @override
  Future<void> cacheContent(List<EducationalContent> content) async {
    final jsonList = content
        .map((item) => (item as EducationalContentModel).toJson())
        .toList();
    await _prefs.setString(_contentKey, jsonEncode(jsonList));
  }
}
