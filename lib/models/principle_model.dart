class PrincipleModel {
  final String id;
  final String name;
  final String content;
  final List<String> imageUrls;

  PrincipleModel({
    required this.id,
    required this.name,
    required this.content,
    required this.imageUrls,
  });

  factory PrincipleModel.fromJson(Map<String, dynamic> json) {
    return PrincipleModel(
      id: json['id'] as String,
      name: json['name'] as String,
      content: json['content'] as String,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'content': content, 'imageUrls': imageUrls};
  }

  @override
  String toString() {
    return 'PrincipleModel{id: $id, name: $name, content: $content, imageUrls: $imageUrls}';
  }
}
