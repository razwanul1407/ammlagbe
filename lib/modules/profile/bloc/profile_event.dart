import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String userId;

  const LoadProfile(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateProfile extends ProfileEvent {
  final String userId;
  final Map<String, dynamic> updatedData;

  const UpdateProfile({required this.userId, required this.updatedData});

  @override
  List<Object?> get props => [userId, updatedData];
}
