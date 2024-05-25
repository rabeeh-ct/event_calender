import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:event_calender/data/models/event_model.dart';
import 'package:event_calender/domain/entities/event_entity.dart';
import 'package:event_calender/utils/debug_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repository/data_repository.dart';
import '../data_sources/local_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  LocalDataSource localDataSource = Get.find();

  @override
  Future<Either<AppError, void>> addEvent(EventEntity params) async {
    try {
      final response =
          await localDataSource.addEvent(EventModel.fromEntity(params));
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> editEvent(EventEntity params) async {
    try {
      consoleLog("index ====== ${params.indexId}");
      final response =
          await localDataSource.editEvent(EventModel.fromEntity(params));
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<EventEntity>>> getEvents() async {
    try {
      final response = await localDataSource.getEvents();
      return Right(
        List<EventEntity>.from(
          response.map(
            (e) => e.toEntity(),
          ),
        ),
      );
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> deleteEvent(int params) async {
    try {
      final response =
      await localDataSource.deleteEvent(params);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
