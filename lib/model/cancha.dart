class Cancha {
  final int id;
  final String nombre;
  final String ubicacion;
  final String telefono;
  final String tipoCancha;
  final String imagenCancha;
  final String logoCancha;
  final List<String> servicios;

  const Cancha({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.telefono,
    required this.tipoCancha,
    required this.imagenCancha,
    required this.logoCancha,
    required this.servicios,
  });

  static const List<Cancha> demoCanchas = [
    Cancha(
      id: 0,
      nombre: "Fleming",
      ubicacion: "Fleming 540",
      telefono: "2945331590",
      tipoCancha: "Césped Sintético",
      imagenCancha: "Fleming.jpeg",
      logoCancha: "fleming.png",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 1,
      nombre: "Club San Martín",
      ubicacion: "Av. Fontana 835",
      telefono: "(02945) 15681194",
      tipoCancha: "Futbol Sala",
      imagenCancha: "Club San Martín.png",
      logoCancha: "san martin.jpg",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 2,
      nombre: "La Española",
      ubicacion: "Rivadavia y Mitre",
      telefono: "(02945) 15334303",
      tipoCancha: "Cesped Natural",
      imagenCancha: "La Española.jpg",
      logoCancha: "española.png",
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
      imagenCancha: "El Molino.png",
      logoCancha: "",
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
      imagenCancha: "Esquel Padding.png",
      logoCancha: "padel.png",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 5,
      nombre: "La Gran 5",
      ubicacion: "Ruta 259 Km. 4",
      telefono: "(02945) 15667025",
      tipoCancha: "Césped Sintético, Cancha Techada",
      imagenCancha: "La Gran 5.png",
      logoCancha: "gran 5.png",
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
      imagenCancha: "La 10 Fc.png",
      logoCancha: "la 10.png",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 7,
      nombre: "La Gambeta",
      ubicacion: "Conesa 986",
      telefono: "(02945) 15339230",
      tipoCancha: "Futbol Sala",
      imagenCancha: "La Gambeta.png",
      logoCancha: "gambeta.png",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
    Cancha(
      id: 8,
      nombre: "Zona Mixta",
      ubicacion: "Almafuerte 1191",
      telefono: "2213548408",
      tipoCancha: "Césped Sintético",
      imagenCancha: "Zona Mixta.jpg",
      logoCancha: "zona mixta.png",
      servicios: [
        "wi-fi, torneos, estacionamiento, parilla, cumpleaños, bar, quincho",
      ],
    ),
  ];
}
