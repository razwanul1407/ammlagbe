import 'package:ammlagbe/core/services/firebase_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirestoreService firestoreService;

  HomeBloc({required this.firestoreService}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // Fetch the current user's UID
      final uid = firestoreService.getCurrentUserId();
      final username = await firestoreService.getUsername(uid);
      // Here you would typically fetch the user data
      // For now, we'll just emit a loaded state with a placeholder
      emit(HomeLoaded(username));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
