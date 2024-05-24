import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

durationToMs(Duration duration) {
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

String dateMonthYear(DateTime dateTime) {
  final convertedDate = DateFormat.yMMMMd().format(dateTime);
  return convertedDate;
}

String formatDuration(DateTime date) {
  Duration duration = DateTime.now().difference(date);
  int hours = duration.inHours;
  int days = duration.inDays;

  if (hours < 24) {
    return '${hours}h';
  } else {
    return '${days}d';
  }
}

String stringTimeFormat(String time, {String? local}) {
  // List<String> times = time.split(":");
  // List<int> timesInt = times.map(int.parse).toList();
  // String formattedTime = "";
  // if (timesInt[0] < 12) {
  //   formattedTime = "${timesInt[0]}.${times[1]} AM";
  // } else if (timesInt[0] == 12) {
  //   if (timesInt[1] == 0) {
  //     formattedTime = "${timesInt[0]}.${times[1]} PM";
  //   } else {
  //     formattedTime = "${timesInt[0]}.${times[1]} PM";
  //   }
  // } else {
  //   formattedTime = "${timesInt[0] - 12}.${times[1]} PM";
  // }
  return DateFormat.jm(local).format(DateFormat("hh:mm:ss").parse(time));
}

TimeOfDay? convertToTimeOfDay(String? timeString) {
  if(timeString==""||timeString==null){
    return null;
  }
  List<String> parts = timeString.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}

TimeOfDay? stringToTimeOfDay(String? timeString) {
  if(timeString==""||timeString==null){
    return null;
  }
  // Split the string into time and period (AM/PM)
  final parts = timeString.split(' ');
  final timeParts = parts[0].split(':');

  // Parse hour and minute
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  final period = parts[1].toUpperCase();

  // Adjust hour based on AM/PM
  if (period == 'PM' && hour != 12) {
    hour += 12;
  } else if (period == 'AM' && hour == 12) {
    hour = 0;
  }

  // Return TimeOfDay object
  return TimeOfDay(hour: hour, minute: minute);
}
// String formatRelativeDate(DateTime date) {
//   RelativeDateFormat relativeDateFormat = RelativeDateFormat(
//     locale: Intl.defaultLocale,
//     // configure the cutoff threshold for displaying the relative date format
//     dayThreshold: 3,
//     // configure the date style
//     style: DateStyle.Compact,
//   );
//   return relativeDateFormat.format(date);
// }

String firstLetterCapital(String str){
  return str[0].toUpperCase()+str.replaceRange(0, 1, "").toLowerCase();
}
