part of 'user_cubit.dart';

@immutable
abstract class UsercubitState {}

class UsercubitInitial extends UsercubitState {}

//login states
class LoadingState extends UsercubitState {}
class SuccessState extends UsercubitState {}
class ErrorState extends UsercubitState {}
class NotFoundState extends UsercubitState {}


//signup states
class SignupLoadingState extends UsercubitState {}
class SignupSuccessState extends UsercubitState {}
class SignupErrorState extends UsercubitState {}

//logout state
class LogedoutState extends UsercubitState {}
