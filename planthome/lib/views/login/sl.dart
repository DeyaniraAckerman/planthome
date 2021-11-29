

import 'package:planthome/core/service_locator.dart';
import 'package:planthome/views/login/data/datasources/login_data_source.dart';
import 'package:planthome/views/login/domain/usescases/login_uc.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_bloc.dart';



void initFeatureLogin() {
  sl.registerLazySingleton(() => LoginDataSource(webClient: sl()));
  sl.registerFactory(() => LoginUc(
        loginDataSource: sl(),
        appPreferences: sl(),
      ));
  sl.registerFactory(() => LoginBloc(loginUc: sl(), session: sl()));
}
