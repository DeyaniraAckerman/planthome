import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:planthome/core/data/datasource/application_preferences.dart';
import 'package:planthome/core/data/datasource/user_preferences.dart';
import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/network/dio_web_client_imp.dart';
import 'package:planthome/views/login/sl.dart';
import 'package:planthome/views/menu/sl.dart';
import 'package:planthome/views/registro_usuario/sl.dart';

import 'package:planthome/core/data/datasource/application_preferences.dart';
import 'package:planthome/core/data/datasource/user_preferences.dart';
import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/network/dio_web_client_imp.dart';
import 'package:planthome/views/login/sl.dart';
import 'package:planthome/views/registro_usuario/sl.dart';

import 'network/web_client.dart';

///Esta archivo se encarga de la administacion de injeccion de dependencias.
final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Core
  await _initCore();
  //Features
  await _initFeatures();
}

Future<void> _initCore() async {
  ///El uso de la interface WebClient y la injeccion de dependencias(DI) permite usar cualquiera de los clientes [Http | DIO | IO]
  /////TODO: pendiente elegir el cliente http correcto [Http | DIO | IO].
  // sl.registerLazySingleton<WebClient>(() => HttpWebClientImpl());
  sl.registerLazySingleton<WebClient>(() => DioWebClientImpl());
  // sl.registerLazySingleton<WebClient>(() => IOWebClientImpl());
  sl.registerLazySingleton(() => UserPreferences());
  sl.registerLazySingleton(() => ApplicationPreferences());
  sl.registerLazySingleton(() => Session());
}

Future<void> _initFeatures() async {
  initFeatureLogin();
  initFeatureRegistro();
  initFeatureMenu();
}
