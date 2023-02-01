part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const <Task>[],
  });

  int get tasksCount => allTasks.length;
  int get doneTasks => allTasks.where((element) => element.isDone!).length;

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((t) => t.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((t) => Task.fromMap(t))).toList(),
    );
  }
}
