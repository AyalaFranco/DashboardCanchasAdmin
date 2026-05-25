import 'package:reserva_cancha/model/cancha.dart';

abstract class CanchasRepository {
    Future<List<Cancha>> fetchAllCanchas();
    Future<List<Cancha>> fetchCanchaByComplejo(int complejoId);
    Future <void> insertCanchas(Cancha cancha);
}