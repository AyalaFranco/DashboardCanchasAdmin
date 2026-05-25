import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseReservasRepository implements ReservasRepository {

  final _client = Supabase.instance.client;

  @override
  Future<List<Reserva>> fetchAllReservas() async {
    final response = await _client.from('RESERVA').select('*, COMPLEJO(*)');

    return (response as List).map((json) => Reserva.fromJson(json)).toList();
  }
}