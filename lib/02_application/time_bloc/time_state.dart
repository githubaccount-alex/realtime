import '../../03_domain/entities/time_entity.dart';
import '../../core/failures/failures.dart';

abstract class TimeState {}

class TimeInitialState extends TimeState {}

class TimeStateLoading extends TimeState {}

class TimeStateLoaded extends TimeState {
  final TimeEntity timeEntity;

  TimeStateLoaded({required this.timeEntity});
}

class TimeStateError extends TimeState {
  final Failure timeFailure;

  TimeStateError({required this.timeFailure});
}
