import 'package:bloc_test/models/Task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
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

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks);

    final int index = allTasks.indexOf(task);

    final Task newTask = task.copyWith(isDone: !task.isDone!);
    allTasks.replaceRange(index, index + 1, [newTask]);

    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = [];

    if (task.isDeleted == true) {
      // If the task is already deleted, permanently delete the task
      allTasks = List.from(state.allTasks)..remove(task);
    } else {
      // Otherwise, mark the task as deleted
      allTasks = List.from(state.allTasks);
      final int index = allTasks.indexOf(task);
      allTasks.replaceRange(index, index + 1, [task.copyWith(isDeleted: true)]);
    }

    emit(TasksState(allTasks: allTasks));
  }


  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks);

    final int index = allTasks.indexOf(task);

    final Task newTask = task.copyWith(isDeleted: false);
    allTasks.replaceRange(index, index + 1, [newTask]);

    emit(TasksState(allTasks: allTasks));
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
