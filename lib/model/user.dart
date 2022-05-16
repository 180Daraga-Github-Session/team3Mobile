class User {
  int? userId;
  String? firstname;
  String? lastname;
  String? password;
  String? email;
  String? token;

  User({this.userId, this.firstname, this.lastname, this.password, this.email});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
