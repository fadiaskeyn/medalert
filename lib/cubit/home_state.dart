import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final List<Map<String, dynamic>> medicationAlarms;

  HomeState(this.medicationAlarms);

  @override
  List<Object> get props => [medicationAlarms];
}

class HomeInitial extends HomeState {
  HomeInitial() : super([]);
}

class HomeLoaded extends HomeState {
  HomeLoaded(List<Map<String, dynamic>> alarms) : super(alarms);
}
