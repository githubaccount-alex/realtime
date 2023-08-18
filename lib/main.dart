import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '01_presentation/pages/time_page.dart';


import '02_application/time_bloc/time_bloc.dart';
import '02_application/time_bloc/time_event.dart';
import 'injection.dart' as di;
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Data Streaming with BLoC',
      home: BlocProvider(
        create: (context) => sl<TimeBloc>()..add(FetchTimeEvent()),
        child: const TimePage(),
      ),
    );
  }
}
