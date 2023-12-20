class MessageModel {
  final String id;
  final String role;
  final String content;
  final bool isLiked;
  MessageModel({
    required this.content,
    required this.role,
    required this.id,
    required this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'role': role,
      'id': id,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      content: map['content'] as String,
      role: map['role'] as String,
      id: map['id'] as String,
      isLiked: map['isLiked'] as bool,
    );
  }

  MessageModel copyWith({
    String? id,
    String? content,
    String? role,
    bool? isLiked,
  }) {
    return MessageModel(
      id: id ?? this.id,
      content: content ?? this.content,
      role: role ?? this.role,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
