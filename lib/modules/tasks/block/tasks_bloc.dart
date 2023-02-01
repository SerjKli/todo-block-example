import 'package:bloc_test/models/Task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<ChangeDoneStatusTask>(_onChangeDoneStatus);
    on<DeleteTask>(_onDeleteTask);
    on<RestoreTask>(_onRestoreTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ),
    );
  }

  void _onChangeDoneStatus(ChangeDoneStatusTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = _replaceTask(
      List.from(state.allTasks),
      task,
      task.copyWith(isDone: !task.isDone),
    );

    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = [];

    if (task.isDeleted) {
      /// If the task is already mark as "deleted", permanently delete the task
      allTasks = List.from(state.allTasks)..remove(task);
    } else {
      /// Otherwise, mark the task as deleted
      allTasks = _replaceTask(
        List.from(state.allTasks),
        task,
        task.copyWith(isDeleted: true),
      );
    }

    emit(TasksState(allTasks: allTasks));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = _replaceTask(
      List.from(state.allTasks),
      task,
      task.copyWith(isDeleted: false),
    );

    emit(TasksState(allTasks: allTasks));
  }

  List<Task> _replaceTask(List<Task> tasks, Task task, Task replaceWith) {
    /// Find the index of given task
    final int index = tasks.indexOf(task);

    /// Replace task on the index with new task
    tasks.replaceRange(index, index + 1, [replaceWith]);

    return tasks;
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
