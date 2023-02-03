import 'package:bloc_test/models/Model.dart';
import 'package:uuid/uuid.dart';

class Task extends Model {
  final String id;
  final String title;
  final bool isDone;
  final bool isDeleted;
  final bool isImportant;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    this.isDeleted = false,
    this.isImportant = false,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? isDeleted,
    bool? isImportant,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isImportant: isImportant ?? this.isImportant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isImportant': isImportant,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? const Uuid().v1(),
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
      isImportant: map['isImportant'] as bool,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone, isDeleted, isImportant];
}
