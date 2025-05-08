import 'package:ammlagbe/core/services/firebase_services.dart';
import 'package:ammlagbe/modules/auth/bloc/auth_bloc.dart';
import 'package:ammlagbe/modules/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeBloc(firestoreService: FirestoreService())
                ..add(LoadHomeData()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Amm Lagbe',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ${state.username}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    const Text('Your mango paradise awaits...'),
                  ],
                ),
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Add mango functionality
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
