class AppUser {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime lastLoginAt;

  final String? childName;
  final DateTime? childBirthDate;
  final List<String>? learningLanguages;
  final bool notificationsEnabled;

  AppUser({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.createdAt,
    required this.lastLoginAt,
    this.childName,
    this.childBirthDate,
    this.learningLanguages = const [],
    this.notificationsEnabled = true,
  });

  String get name => displayName ?? email.split('@').first;

  bool get hasCompletedProfile => childName != null && childBirthDate != null;
}
