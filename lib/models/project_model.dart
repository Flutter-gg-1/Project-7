
class Project {
  final String title;
  final String description;
  final double rating;
  final bool isOpen;

  Project({
    required this.title,
    required this.description,
    required this.rating,
    required this.isOpen,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      isOpen: json['isOpen'],
    );
  }
}
