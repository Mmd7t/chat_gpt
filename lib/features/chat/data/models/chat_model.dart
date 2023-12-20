import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final int id;
  final String title;
  const ChatModel({
    required this.id,
    required this.title,
  }) : super();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
