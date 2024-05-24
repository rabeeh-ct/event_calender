import 'package:dartz/dartz.dart';
import 'package:event_calender/domain/entities/event_entity.dart';

import '../entities/app_error.dart';

abstract class DataRepository {

  Future<Either<AppError, void>> addEvent(EventEntity params);

  Future<Either<AppError, void>> editEvent(EventEntity params);

  Future<Either<AppError, List<EventEntity>>> getEvents();

  Future<Either<AppError, void>> deleteEvent(int params);

}
