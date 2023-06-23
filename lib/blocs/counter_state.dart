part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class Processing extends CounterState {}
class LoggedIn extends CounterState {}
class LoggedInFailed extends CounterState {}
