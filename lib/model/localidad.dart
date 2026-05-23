class Localidad {
  final int idLocalidad;
  final String localidad;
  final Provincia provincia;

  Localidad({
    required this.idLocalidad,
    required this.localidad,
    required this.provincia,
  });

  factory Localidad.fromJson(Map<String, dynamic> json) {
    return Localidad(
      idLocalidad: json['idLocalidad'],
      localidad: json['localidad'],
      provincia: Provincia.fromJson(json['PROVINCIA']),
    );
  }
}

class Provincia {
  final int idProvincia;
  final String provincia;
  final Pais pais;

  Provincia({
    required this.idProvincia,
    required this.provincia,
    required this.pais,
  });

  factory Provincia.fromJson(Map<String, dynamic> json) {
    return Provincia(
      idProvincia: json['idProvincia'],
      provincia: json['provincia'],
      pais: Pais.fromJson(json['PAIS']),
    );
  }
}

class Pais {
  final int idPais;
  final String pais;

  Pais({required this.idPais, required this.pais});

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      idPais: json['idPais'],
      pais: json['pais']
    );
  }
}
