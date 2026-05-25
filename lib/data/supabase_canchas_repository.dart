import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCanchasRepository implements CanchasRepository {
  final _client = Supabase.instance.client;
  final String bucketUrlCancha =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_cancha/";
  final String bucketUrlComplejo =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_predio/";

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

    return (response as List).map(_canchaWithSupabaseImage).toList();
  }

  Cancha _canchaWithSupabaseImage(dynamic json) {
    if (json['imagenCancha'] != null) {
      json['imagenCancha'] = bucketUrlCancha + json['imagenCancha'];
    }

    if (json['COMPLEJO']['logoCancha'] != null) {
      json['COMPLEJO']['logoCancha'] =
          bucketUrlComplejo + json['COMPLEJO']['logoCancha'];
    }

    return Cancha.fromJson(json);
  }

  @override
  Future<void> insertCanchas(Cancha cancha) async{
    await _client.from('CANCHA').insert(cancha.toJson());
  }


}
