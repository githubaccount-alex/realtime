import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:realtime/02_application/time_bloc/time_event.dart';
import 'package:realtime/02_application/time_bloc/time_state.dart';
import 'package:realtime/03_domain/entities/time_entity.dart';

import '../../03_domain/usecases/time_usecases.dart';
import '../../core/failures/failures.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final TimeUsecases timeUsecases;

  StreamSubscription<dynamic>? _timeStreamSub;

  TimeBloc({required this.timeUsecases}) : super(TimeInitialState()) {
    on<FetchTimeEvent>((event, emit) async {
      emit(TimeStateLoading());

      await _timeStreamSub?.cancel();
      _timeStreamSub = Stream.periodic(const Duration(seconds: 1)).listen((_) {
        timeUsecases.getTimeUsecase().listen((failureOrTimes) =>
            add(TimeUpdatedEvent(failureOrTimes: failureOrTimes)));
      });

    });

    on<TimeUpdatedEvent>((event, emit) {
      event.failureOrTimes.fold(
          (failures) => emit(TimeStateError(timeFailure: failures)),
          (time) => emit(TimeStateLoaded(timeEntity: time)));
    });
  }

  @override
  Future<void> close() async {
    await _timeStreamSub?.cancel();
    return super.close();
  }
}
