import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EventEntity extends Equatable {
  final DateTime date;
  final String time;
  final String title;
  final int repeatType;
  final int? indexId;

  const EventEntity({
    required this.date,
    required this.time,
    required this.title,
    required this.repeatType,
    this.indexId
  });

  @override
  List<Object?> get props => [date, time, title, repeatType];
}
