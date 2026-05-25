import 'package:reserva_cancha/model/reserva.dart';

abstract class ReservasRepository {
  Future<List<Reserva>> fetchAllReservas();

}