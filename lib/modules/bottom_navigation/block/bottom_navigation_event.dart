part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class ChangeTabIndexEvent extends BottomNavigationEvent {
  final int newIndex;

  const ChangeTabIndexEvent({required this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
