/// Represents all the information related to a user of the system
class User {
  final int index;
  final String about;
  final String name;
  final String email;
  final String picture;

  User(this.index, this.about, this.name, this.email, this.picture);

//  factory User.fromJson(Map<String, dynamic> json) => User(
//        index: json['index'],
//        about: json['about'],
//        name: json['name'],
//        email: json['email'],
//        picture: json['picture'],
//      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['about'] = this.about;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.picture;
    return data;
  }
}
