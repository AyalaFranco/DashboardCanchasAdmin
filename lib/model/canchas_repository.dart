import 'package:reserva_cancha/model/cancha.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CanchasRepository {
    Future<List<Cancha>> fetchAllCanchas();
    Future<List<Cancha>> fetchCanchasByDuenio(String idUsuario);
    Future<List<Cancha>> fetchCanchaByComplejo(int complejoId);
    Future<Cancha> fetchCancha(int canchaId);
    Future<void> storeCancha(Cancha cancha);
    Future<void> updateCancha(Cancha updatedCancha);
    Future<void> deleteCancha(int canchaId);

  Future<void> insertCanchas(Cancha cancha) async {}

}


