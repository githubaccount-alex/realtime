import 'package:dartz/dartz.dart';
import 'package:realtime/03_domain/entities/time_entity.dart';

import '../../core/failures/failures.dart';

abstract class TimeEvent {}

class FetchTimeEvent extends TimeEvent {}

class TimeUpdatedEvent extends TimeEvent {
  final Either<Failure, TimeEntity> failureOrTimes;
  TimeUpdatedEvent({required this.failureOrTimes});
}