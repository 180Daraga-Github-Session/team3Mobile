class NoteList {
  List<Note>? notes=[];

  NoteList({this.notes});

  NoteList.fromJson(json) {
    if (json['notes'] != null) {
      json['notes'].forEach((v) {
        notes!.add(Note.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (notes != null) {
      data['notes'] = notes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Note {
  String? sId;
  int? userId;
  String? noteTitle;
  String? noteBody;
  String? noteDate;
  int? iV;

  Note(
      {this.sId,
      this.userId,
      this.noteTitle,
      this.noteBody,
      this.noteDate,
      this.iV});

  Note.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    noteTitle = json['noteTitle'];
    noteBody = json['noteBody'];
    noteDate = json['noteDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['noteTitle'] = this.noteTitle;
    data['noteBody'] = this.noteBody;
    data['noteDate'] = this.noteDate;
    data['__v'] = this.iV;
    return data;
  }
}
