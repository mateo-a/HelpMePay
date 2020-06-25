class Loan {
  int monto;
  int totalcuotas;
  String estado;
  String fechalimite;
  String titulo;
  String descripcion;
  String worker;

  Loan(this.monto, this.totalcuotas, this.estado, this.fechalimite, this.titulo,
      this.descripcion, this.worker);

 /*factory Loan.fromJson(Map<String, dynamic> json) => Loan(
       monto: json['monto'],
       totalcuotas: json['totalcuotas'],
       estado: json['estado'],
       fechalimite: json['fechalimite'],
       titulo: json['titulo'],
     );*/

  Loan.fromJson(Map<String, dynamic> json) {
    monto = json['monto'];
    totalcuotas = json['totalcuotas'];
    estado = json['estado'];
    fechalimite = json['fechalimite'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    worker = json['worker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monto'] = this.monto;
    data['totalcuotas'] = this.totalcuotas;
    data['estado'] = this.estado;
    data['fechalimite'] = this.fechalimite;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['worker'] = this.worker;
    return data;
  }
}
