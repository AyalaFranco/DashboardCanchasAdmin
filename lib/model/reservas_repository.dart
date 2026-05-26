import 'package:reserva_cancha/model/reserva.dart';

abstract class ReservasRepository {
  Future<List<Reserva>> fetchAllReservas();
  Future<List<Reserva>> fetchReservasOfUser(String uuidUser);
  Future<List<Reserva>> fetchReservasOfCancha(int canchaId);
}