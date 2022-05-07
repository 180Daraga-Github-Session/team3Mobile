import 'dart:convert';

import 'package:team3/screens/homeScreen.dart';
import 'package:http/http.dart' as http;

// Future<List<Data>> getHttp() async {
//   List<Data>?notes = [];
//   try {
//     var response =
//         await Dio().get('https://team3-github-180daraga.herokuapp.com/notes');
//     var responsebody = jsonDecode(response.data);
//     return notes;
//   } catch (e) {
//     print(e);
//   }
// }
var length = 0;
Future<List<Data>> getData() async {
  var response = await http
      .get(Uri.parse("https://team3-github-180daraga.herokuapp.com/notes"));
  var jsonData = jsonDecode(response.body);
  List<Data> dataList = [];
  for (var u in jsonData) {
    Data data = Data(u["title"], u["body"], u["date"]);
    dataList.add(data);
  }
  length = dataList.length;
  print(dataList[0].title);
  return dataList;
}

Future<http.Response?> postData(String title, String body) async {
  title == null ? title = "null" : title = title;
  body == null ? body = "null" : body = body;

  try {
    final response = await http.post(
        Uri.parse("https://team3-github-180daraga.herokuapp.com/notes"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"title": title, "body": body}));
    print("done");
    return response;
  } catch (err) {
    print(err);
  }
}
