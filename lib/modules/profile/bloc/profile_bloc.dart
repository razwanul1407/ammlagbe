import 'package:ammlagbe/core/services/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirestoreService firestoreService;

  ProfileBloc({required this.firestoreService}) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final userData = await firestoreService.getUserData(event.userId);
      emit(ProfileLoaded(userData: userData));
    } catch (e) {
      emit(ProfileError(message: 'Failed to load profile: $e'));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      await firestoreService.updateUserData(
        uid: event.userId,
        updatedData: event.updatedData,
      );
      final userData = await firestoreService.getUserData(event.userId);
      emit(ProfileLoaded(userData: userData));
    } catch (e) {
      emit(ProfileError(message: 'Failed to update profile: $e'));
    }
  }
}
