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
  
}