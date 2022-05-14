part of 'user_cubit.dart';

@immutable
abstract class UsercubitState {}

class UsercubitInitial extends UsercubitState {}

class LoadingState extends UsercubitState {}

class SuccessState extends UsercubitState {
  final User? user;
  SuccessState({this.user});
}

class ErrorState extends UsercubitState {}
class LogedoutState extends UsercubitState {}
