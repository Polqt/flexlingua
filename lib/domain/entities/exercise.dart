class Exercise {
  final String id;
  final String title;
  final String description;
  final String instructions;
  final String category;
  final int durationSeconds;
  final int repetitions;
  final String difficultyLevel;
  final List<String> tags;
  final DateTime createdAt;
  final bool isCompleted;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.instructions,
    required this.category,
    required this.durationSeconds,
    required this.repetitions,
    required this.difficultyLevel,
    required this.tags,
    required this.createdAt,
    this.isCompleted = false,
  });

  Exercise copyWith({
    bool? isCompleted,
  }) {
    return Exercise(
      id: id,
      title: title,
      description: description,
      instructions: instructions,
      category: category,
      durationSeconds: durationSeconds,
      repetitions: repetitions,
      difficultyLevel: difficultyLevel,
      tags: tags,
      createdAt: createdAt,
      isCompleted: isCompleted ?? this.isCompleted, 
    );
  }
}
