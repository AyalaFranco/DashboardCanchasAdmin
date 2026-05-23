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

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Localidad &&
            runtimeType == other.runtimeType &&
            idLocalidad == other.idLocalidad;
  }

  @override
  int get hashCode => idLocalidad.hashCode;
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

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Provincia &&
            runtimeType == other.runtimeType &&
            idProvincia == other.idProvincia;
  }

  @override
  int get hashCode => idProvincia.hashCode;
}

class Pais {
  final int idPais;
  final String pais;

  Pais({required this.idPais, required this.pais});

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(idPais: json['idPais'], pais: json['pais']);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Pais &&
            runtimeType == other.runtimeType &&
            idPais == other.idPais;
  }

  @override
  int get hashCode => idPais.hashCode;
}
