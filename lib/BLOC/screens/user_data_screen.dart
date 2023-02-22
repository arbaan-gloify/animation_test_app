import 'package:animation_test_app/BLOC/bloc/user_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserdataScreen extends StatefulWidget {
  const UserdataScreen({super.key});

  @override
  State<UserdataScreen> createState() => _UserdataScreenState();
}

class _UserdataScreenState extends State<UserdataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Get Api"),
      ),
      body: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          if (state is UserDataInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDataLoaded) {
            return Center(
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Text(state.model.userId.toString()),
                  title: Text(state.model.title),
                  subtitle: Text(state.model.body),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
