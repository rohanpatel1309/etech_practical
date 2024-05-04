part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final List<User> listUser;

  UserLoaded({required this.listUser});
}

final class UserError extends UserState {}
