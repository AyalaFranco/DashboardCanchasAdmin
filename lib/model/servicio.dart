class Servicio {
  final int idServicio;
  final String servicio;

  Servicio({required this.idServicio, required this.servicio});

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(idServicio: json['idServicio'], servicio: json['servicio']);
  }
}
