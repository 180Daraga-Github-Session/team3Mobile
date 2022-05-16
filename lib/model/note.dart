class Note {
  int? userId;
  String? noteTitle;
  String? noteBody;

  Note({this.userId, this.noteTitle, this.noteBody});

  Note.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    noteTitle = json['noteTitle'];
    noteBody = json['noteBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['noteTitle'] = this.noteTitle;
    data['noteBody'] = this.noteBody;
    return data;
  }
}
