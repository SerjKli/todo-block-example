part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const <Task>[],
  });

  List<Task> get trashedTasks => [...allTasks.where((task) => task.isDeleted == true).toList()];
  List<Task> get activeTasks => [...allTasks.where((element) => element.isDeleted == false).toList()];
  List<Task> get importantActiveTasks =>
      [...activeTasks.where((element) => element.isImportant == true).toList()];

  int get tasksCount => activeTasks.length;
  int get doneTasksCount => activeTasks.where((element) => element.isDone).length;
  int get importantTasksCount => importantActiveTasks.length - importantDoneTasksCount;
  int get importantDoneTasksCount => importantActiveTasks.where((element) => element.isDone).length;
  int get notDoneActiveTasks => tasksCount - doneTasksCount;
  int get trashedTasksCount => trashedTasks.length;

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
