import 'package:dartz/dartz.dart';
import 'package:event_calender/domain/entities/event_entity.dart';
import 'package:event_calender/domain/params/no_params.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';
import '../repository/data_repository.dart';
import 'usecase.dart';

class DeleteEventsUseCase extends UseCase<void, int> {
  final DataRepository dataRepository = Get.find();

  @override
  Future<Either<AppError, void>> call(int params, {Map<String, dynamic>? queryParameters}) async {
    return await dataRepository.deleteEvent(params);
  }
}
