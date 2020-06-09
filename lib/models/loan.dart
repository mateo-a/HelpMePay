class Loan {
  int amount;
  int installments; 
  String status;
  String expiration;
  String whatFor;
  String story;

  Loan(this.amount, this.installments, this.status, this.expiration, this.whatFor,this.story);

//  factory User.fromJson(Map<String, dynamic> json) => User(
//        index: json['index'],
//        about: json['about'],
//        name: json['name'],
//        email: json['email'],
//        picture: json['picture'],
//      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['installments'] = this.installments;
    data['status'] = this.status;
    data['expiration'] = this.expiration;
    data['whatFor'] = this.whatFor;
    data['story'] = this.story;
    return data;
  }

}
