class Note {
  int? userId;
  String? noteTitle;
  String? noteBody;

  Note({this.userId, this.noteTitle, this.noteBody});

  Note.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    noteTitle = json['title'];
    noteBody = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['title'] = noteTitle;
    data['body'] = noteBody;
    return data;
  }
}
