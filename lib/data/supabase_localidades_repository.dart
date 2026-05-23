import 'package:reserva_cancha/model/localidad.dart';
import 'package:reserva_cancha/model/localidades_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseLocalidadesRepository implements LocalidadesRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Pais>> fetchAllPaises() async {
    final response = await _client.from('PAIS').select('*');

    return (response as List).map((json) => Pais.fromJson(json)).toList();
  }

  @override
  Future<List<Provincia>> fetchProvinciasByPais(int paisId) async {
    final response = await _client
        .from('PROVINCIA')
        .select('*, PAIS(*)')
        .eq('idPais', paisId);

    return (response as List).map((json) => Provincia.fromJson(json)).toList();
  }

  @override
  Future<List<Localidad>> fetchLocalidadesByProvincia(int provinciaId) async {
    final response = await _client
        .from('LOCALIDAD')
        .select('*, PROVINCIA(*, PAIS(*))')
        .eq('idProvincia', provinciaId);

    return (response as List).map((json) => Localidad.fromJson(json)).toList();
  }
}
