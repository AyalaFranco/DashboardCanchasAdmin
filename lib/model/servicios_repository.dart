import 'package:reserva_cancha/model/servicio.dart';

abstract class ServiciosRepository {
  Future<List<Servicio>> fetchAllServicios();
  Future<List<Servicio>> fetchServiciosOfComplejo(int complejoId);
}