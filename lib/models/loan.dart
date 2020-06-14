  class Loan {
  int monto;
  int totalcuotas; 
  String estado;
  String fechalimite;
  String titulo;
  String descripcion;

  Loan(this.monto, this.totalcuotas, this.estado, this.fechalimite, this.titulo ,this.descripcion);

//  factory User.fromJson(Map<String, dynamic> json) => User(
//        index: json['index'],
//        about: json['about'],
//        name: json['name'],
//        email: json['email'],
//        picture: json['picture'],
//      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monto'] = this.monto;
    data['totalcuotas'] = this.totalcuotas;
    data['estado'] = this.estado;
    data['fechalimite'] = this.fechalimite;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    return data;
  }

}
