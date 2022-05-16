import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:team3/model/note.dart';

import '../../../network/dio-helper/dio_service.dart';
import '../../../network/sp-helper/cache_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteCubitInitial());
  static NoteCubit get(context) => BlocProvider.of(context);

  Note? note;
  addNote({String? title, String? body}) {
    emit(NoteLoadingState());
    
    DioHelper.postData(url: "note/", data: {'title': title, 'body': body ,}, token: SharedPreferencesHelper.getData(key: 'token'))
        .then((value) {
      emit(NoteSuccessState());
    }).catchError((error) {
      emit(NoteErrorState());
    });
  }
}
