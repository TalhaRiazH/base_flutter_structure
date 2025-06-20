class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  // Factory constructor to create TodoModel from JSON
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
    );
  }

  // Convert TodoModel to JSON
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  // Optional: Override toString for debugging
  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  // Optional: Create a copyWith method for updating
  TodoModel copyWith({int? userId, int? id, String? title, bool? completed}) {
    return TodoModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
