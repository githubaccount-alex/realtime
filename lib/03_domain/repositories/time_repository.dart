

import 'package:dartz/dartz.dart';
import 'package:realtime/03_domain/entities/time_entity.dart';

import '../../core/failures/failures.dart';

abstract class TimeRepository {
  Stream<Either<Failure, TimeEntity>> getTimeStreamFromApi();
}