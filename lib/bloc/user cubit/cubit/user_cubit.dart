import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:team3/model/user.dart';
import 'package:team3/network/sp-helper/cache_helper.dart';
import '../../../network/dio-helper/dio_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UsercubitState> {
  UserCubit() : super(UsercubitInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  User? user;

  login(String email, String password) {
    emit(LoadingState());
    DioHelper.postData(
        url: "user/login/",
        data: {'email': email, 'password': password}).then((value) {
      user = User.fromJson(value.data);
      SharedPreferencesHelper.saveData(key: 'token', value: user!.token);
      emit(SuccessState());
    }).catchError((error) {
      emit(ErrorState());
    });
  }

  signup(
      {required String? email,
      required String? password,
      required String? firstName,
      required String? lastName}) {
    emit(SignupLoadingState());
    DioHelper.postData(url: "user/", data: {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password
    }).then((value) {
      user = User.fromJson(value.data);
      emit(SignupSuccessState());
      SharedPreferencesHelper.saveData(key: 'token', value: user!.token);

/**this section is only needed if the api returns token not user****/
      user!.firstname = firstName;
      user!.lastname = lastName;
      user!.email = email;
      user!.password = password;
/*****************************************************************/

    }).catchError((error) {
      emit(SignupErrorState());
    });
  }

  logout() {
    SharedPreferencesHelper.removeData(key: 'token');
    emit(LogedoutState());
  }
}
