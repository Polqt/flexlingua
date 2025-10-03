import 'package:flexlingua_app/domain/entities/educational_content.dart';
import 'package:flexlingua_app/domain/repositories/content_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  throw UnimplementedError();
});

final contentProvider =
    StateNotifierProvider<
      ContentNotifier,
      AsyncValue<List<EducationalContent>>
    >((ref) {
      final repo = ref.watch(contentRepositoryProvider);
      return ContentNotifier(repo);
    });

class ContentNotifier
    extends StateNotifier<AsyncValue<List<EducationalContent>>> {
  final ContentRepository _repository;

  ContentNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadContent();
  }

  Future<void> loadContent() async {
    try {
      final content = await _repository.getAllContent();
      state = AsyncValue.data(content);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> searchContent(String query) async {
    if (query.isEmpty) {
      loadContent();
      return;
    }
    state = const AsyncValue.loading();
    try {
      final results = await _repository.searchContent(query);
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
