import 'package:dartz/dartz.dart';
import 'package:realtime/03_domain/entities/time_entity.dart';

import '../../core/failures/failures.dart';
import '../repositories/time_repository.dart';

class TimeUsecases {
  final TimeRepository timeRepository;

  TimeUsecases({required this.timeRepository});

  Stream<Either<Failure, TimeEntity>> getTimeUsecase() async* {
    yield* timeRepository.getTimeStreamFromApi();
  }
// Businesslogik hier implementieren !
}
