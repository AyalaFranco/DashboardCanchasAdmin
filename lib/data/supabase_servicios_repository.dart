import 'package:reserva_cancha/model/servicio.dart';
import 'package:reserva_cancha/model/servicios_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiciosRepository implements ServiciosRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Servicio>> fetchAllServicios() async {
    final response = await _client.from('SERVICIO').select('*');

    return (response as List).map((json) => Servicio.fromJson(json)).toList();
  }

  @override
  Future<List<Servicio>> fetchServiciosOfComplejo(int complejoId) async {
    final response = await _client
        .from("SERVICIO_COMPLEJO")
        .select("SERVICIO(*)")
        .eq('idComplejo', complejoId);

    return (response as List)
        .map((json) => Servicio.fromJson(json["SERVICIO"]))
        .toList();
  }
}
