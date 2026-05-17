class Complejo {
  final int idComplejo;
  final bool activa;
  final String nombreComplejo;
  final String? logoCancha;
  final String direccion;
  final String telefono;

  Complejo({
    required this.idComplejo,
    required this.activa,
    required this.nombreComplejo,
    required this.logoCancha,
    required this.direccion,
    required this.telefono,
  });

  factory Complejo.fromJson(Map<String, dynamic> json) {
    return Complejo(
      idComplejo: json['idComplejo'],
      activa: json['activa'],
      nombreComplejo: json['nombreComplejo'],
      logoCancha: json['logoCancha'],
      direccion: json['direccion'],
      telefono: json['telefono'],
    );
  }

}
