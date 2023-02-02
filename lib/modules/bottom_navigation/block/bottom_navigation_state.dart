part of 'bottom_navigation_bloc.dart';

class BottomNavigationState {
  final PageController controller;

  BottomNavigationState({
    this.controller = Page
  });


  @override
  List<Object> get props => [tabIndex];

  Map<String, dynamic> toMap() {
    return {
      'tabIndex': tabIndex,
    };
  }

  factory BottomNavigationState.fromMap(Map<String, dynamic> map) {
    return BottomNavigationState(
      tabIndex: map['tabIndex'] as int,
    );
  }
}
