import 'dart:io';

import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  final response = await dio.get(
      'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json');
  // ignore: avoid_print
  print(response);
  stdout.write('object');
}
