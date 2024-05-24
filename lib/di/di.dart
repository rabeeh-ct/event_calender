import 'package:get/get.dart';

import '../data/data_sources/local_data_source.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/data_repository.dart';
import '../presentation/screens/home_screen/home_screen_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(), fenix: true);
    Get.lazyPut<LocalDataSource>(() => LocalDataSourceImpl(), fenix: true);

  }
}
