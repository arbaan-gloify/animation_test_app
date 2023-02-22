import 'package:animation_test_app/BLOC/model/user_model.dart';
import 'package:animation_test_app/BLOC/repository/userdata_repo.dart';
import 'package:animation_test_app/BLOC/service/user_data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(UserDataInitial()) {
    final Api api = Api();
    on<GetApi>((event, emit) async {
      try {
        emit(UserDataLoading());
        final data = await api.getApi();
        emit(UserDataLoaded(data));
      } on NetworkError {
        emit(UserDataFailed());
      }
    });
  }
}
