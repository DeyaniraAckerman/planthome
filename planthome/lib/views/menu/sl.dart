import 'package:planthome/core/service_locator.dart';
import 'package:planthome/views/menu/data/datasources/menu_data_source.dart';
import 'package:planthome/views/menu/domain/usescases/menu_uc.dart';
import 'package:planthome/views/menu/presentacion/bloc/menu_bloc.dart';

void initFeatureMenu() {
  sl.registerFactory(() => MenuDataSource(webClient: sl()));
  sl.registerFactory(() => MenuUc(loginDataSource: sl()));
  sl.registerFactory(() => MenuBloc(loginUc: sl()));
}
