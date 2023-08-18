import 'dart:convert';

import '../../core/exceptions/exceptions.dart';
import '../models/time_model.dart';
import 'package:http/http.dart' as http;

abstract class TimeRemoteDatasource {
  Future<TimeModel> getTimeModelFromApi();
}

class TimeRemoteDatasourceImpl implements TimeRemoteDatasource {
  final http.Client client;

  TimeRemoteDatasourceImpl({required this.client});

  @override
  Future<TimeModel> getTimeModelFromApi() async {
    final response = await client.get(
      Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Vienna'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);

      return TimeModel.fromJsonToModel(responseBody);
    }
  }
}
