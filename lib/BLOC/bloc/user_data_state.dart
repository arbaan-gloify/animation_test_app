part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataFailed extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final UserDataModel model;
  const UserDataLoaded(this.model);
}
