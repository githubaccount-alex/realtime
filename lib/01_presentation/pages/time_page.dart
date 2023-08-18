import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:realtime/01_presentation/pages/widgets/time_field.dart';

import '../../02_application/time_bloc/time_bloc.dart';
import '../../02_application/time_bloc/time_state.dart';
import '../core/error_message.dart';

class TimePage extends StatelessWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<TimeBloc, TimeState>(
            bloc: BlocProvider.of<TimeBloc>(context),
            builder: (context, timeState) {
              if (timeState is TimeStateLoading) {
                return const CircularProgressIndicator();
              } else if (timeState is TimeStateLoaded) {
                return TimeField(time: timeState.timeEntity.timeValue);
              } else if (timeState is TimeStateError) {
                return const ErrorMessage(message: 'Error');
              } else {
                return const Placeholder();
              }
            }));
  }
}
