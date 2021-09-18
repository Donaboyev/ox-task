import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ox_system_task/src/app.dart';
import 'package:ox_system_task/src/core/di/http_service.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSource.getInstance();

  GetIt.I.registerLazySingleton<HttpService>(() => HttpService());

  runApp(TaskApp());
}
