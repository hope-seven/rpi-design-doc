class MethodologyModel {
  final String id;
  final String name;
  final List<String> content; // formerly description
  final List<String> imageUrls;

  MethodologyModel({
    required this.id,
    required this.name,
    required this.content,
    required this.imageUrls,
  });

  factory MethodologyModel.fromJson(Map<String, dynamic> json) {
    return MethodologyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      content: List<String>.from(json['content'] ?? []),
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'content': content, 'imageUrls': imageUrls};
  }

  @override
  String toString() {
    return 'MethodologyModel{id: $id, name: $name, content: $content, imageUrls: $imageUrls}';
  }
}
