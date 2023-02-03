part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ChangeDoneStatusTask extends TasksEvent {
  final Task task;

  const ChangeDoneStatusTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RestoreTask extends TasksEvent {
  final Task task;

  const RestoreTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ChangeImportantTask extends TasksEvent {
  final Task task;

  const ChangeImportantTask({required this.task});

  @override
  List<Object> get props => [task];
}