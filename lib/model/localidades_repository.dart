import 'package:reserva_cancha/model/localidad.dart';

//Este repositorio solo debe soportar operaciones de lectura.
//La carga de localidades/provincias/paises debe hacerse desde la base de datos.
abstract class LocalidadesRepository {
  Future<List<Pais>> fetchAllPaises();
  Future<List<Provincia>> fetchProvinciasByPais(int paisId);
  Future<List<Localidad>> fetchLocalidadesByProvincia(int provinciaId);
}