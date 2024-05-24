import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/event_entity.dart';
part 'event_model.g.dart';

@HiveType(typeId: 0)
class EventModel extends Equatable {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final int repeatType;
  @HiveField(4)
  int? indexId;

  EventModel({
    required this.date,
    required this.time,
    required this.title,
    required this.repeatType,
    this.indexId,
  });

  @override
  List<Object?> get props => [date, time, title, repeatType];

  factory EventModel.fromEntity(EventEntity eventEntity) {
    return EventModel(
      date: eventEntity.date,
      time: eventEntity.time,
      title: eventEntity.title,
      repeatType: eventEntity.repeatType,
      indexId: eventEntity.indexId,
    );
  }

  EventEntity toEntity() {
    return EventEntity(
      date: date,
      time: time,
      title: title,
      repeatType: repeatType,
      indexId: indexId
    );
  }
}
