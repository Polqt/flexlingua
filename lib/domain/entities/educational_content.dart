class EducationalContent {
  final String id;
  final String title;
  final String description;
  final String content;
  final String category;
  final List<String> tags;
  final DateTime createdAt;

  EducationalContent({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.category,
    required this.tags,
    required this.createdAt,
  });

  bool matchesSearch(String searchTerm) {
    final term = searchTerm.toLowerCase();
    return title.toLowerCase().contains(term) ||
        content.toLowerCase().contains(term) ||
        tags.any((tag) => tag.toLowerCase().contains(term));
  }
}
