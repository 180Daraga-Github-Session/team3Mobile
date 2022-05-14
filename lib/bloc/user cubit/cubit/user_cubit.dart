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
        url: "user/",
        data: {'email': email, 'password': password}).then((value) {
      user = User.formJson(value.data);
      SharedPreferencesHelper.saveData(key: 'token', value: user!.accessToken);
      emit(SuccessState(user: user));
    }).catchError((error) {
      emit(ErrorState());
    });
  }

  logout() {
    SharedPreferencesHelper.removeData(key: 'token');
    emit(LogedoutState());
  }
}
