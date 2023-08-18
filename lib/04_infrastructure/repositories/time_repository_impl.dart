import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:realtime/03_domain/entities/time_entity.dart';
import 'package:realtime/03_domain/repositories/time_repository.dart';
import 'package:realtime/core/failures/failures.dart';

import '../../core/exceptions/exceptions.dart';
import '../datasources/time_remote_datasource.dart';
import '../models/time_model.dart';

class TimeRepositoryImpl implements TimeRepository {
  final TimeRemoteDatasource timeRemoteDatasource;

  TimeRepositoryImpl({required this.timeRemoteDatasource});

  @override
  Stream<Either<Failure, TimeEntity>> getTimeStreamFromApi() async* {
    try {
      final time = await timeRemoteDatasource.getTimeModelFromApi();

      final timeEntity = fromModelToEntity(time);

      yield Right(timeEntity);
    } catch (e) {
      if (e is ServerException) {
        yield Left(ServerFailure());
      } else {
        yield Left(GeneralFailure());
      }
    }
  }

  TimeEntity fromModelToEntity(TimeModel timeModel) {
    return TimeEntity(
      timeValue: timeModel.timeValue,
      unixTime: timeModel.unixTime,
      timeZone: timeModel.timeZone,
    );
  }
}
