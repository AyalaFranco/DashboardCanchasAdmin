class Cancha {
  final int id;
  final String nombre;
  final String ubicacion;
  final String telefono;
  final String tipoCancha;
  final List<String> servicios;

  const Cancha({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.telefono,
    required this.tipoCancha,
    required this.servicios,
  });

  static const List<Cancha> demoCanchas = [
    Cancha(
      id: 0,
      nombre: "Fleming",
      ubicacion: "Fleming 540",
      telefono: "2945331590",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 1,
      nombre: "Club San Martín",
      ubicacion: "Av. Fontana 835",
      telefono: "(02945) 15681194",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 2,
      nombre: "Club Social y Deportivo Del Campo",
      ubicacion: "Rivadavia y Mitre",
      telefono: "(02945) 15334303",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 3,
      nombre: "El Molino",
      ubicacion: "Alberdi 251",
      telefono: "(02945) 15553978",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 4,
      nombre: "Esquel Padding",
      ubicacion: "Chacabuco 1791",
      telefono: "2945594466",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 5,
      nombre: "La Gran 5",
      ubicacion: "Ruta 259 Km. 4",
      telefono: "(02945) 15667025",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 6,
      nombre: "La 10 Fc",
      ubicacion: "Brun 750",
      telefono: "(02945) 15403268",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 7,
      nombre: "La Gambeta",
      ubicacion: "Conesa 986",
      telefono: "(02945) 15339230",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 8,
      nombre: "La Martita Fútbol de Campo",
      ubicacion: "Ruta 259 Km. 4",
      telefono: "2945416644",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 9,
      nombre: "Zona Mixta",
      ubicacion: "Almafuerte 1191",
      telefono: "2213548408",
      tipoCancha: "Césped Sintético",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
  ];
}
