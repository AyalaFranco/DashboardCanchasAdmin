class Pais {
  final int idPais;
  final String pais;

  Pais({
    required this.idPais,
    required this.pais,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      idPais: json['idPais'],
      pais: json['pais'],
    );
  }
}

