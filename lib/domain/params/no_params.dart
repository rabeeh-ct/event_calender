import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => throw UnimplementedError();

// Map<String, dynamic> toMap() {
//   return {'offset': offSet, 'fcm_token': fcmToken, "language": language};
// }
}
