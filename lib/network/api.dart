import 'package:dio/dio.dart';

List<Map<int, String>> notes = [];
Future getHttp() async {
  try {
    var response =
        await Dio().get('https://team3-github-180daraga.herokuapp.com/notes');
    notes = response.data;
    print(notes);
    //print(notes);
    return response.data;
  } catch (e) {
    print(e);
  }
}
