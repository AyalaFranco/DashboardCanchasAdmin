import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCanchasRepository implements CanchasRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Cancha>> fetchCanchaByComplejo(int complejoId) async {
    final response = await _client
        .from('CANCHA')
        .select('*, COMPLEJO(*)')
        .eq('idComplejo', complejoId);

    return (response as List).map((json) => Cancha.fromJson(json)).toList();
  }

  @override
  Future<List<Cancha>> fetchAllCanchas() async {
    final response = await _client.from('CANCHA').select('*, COMPLEJO(*)');

    return (response as List).map((json) => Cancha.fromJson(json)).toList();
  }
}
