import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCanchasRepository implements CanchasRepository {
  final _client = Supabase.instance.client;
  final String _bucketUrlCancha =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_cancha/";
  final String _bucketUrlComplejo =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_predio/";

  @override
  Future<List<Cancha>> fetchCanchaByComplejo(int complejoId) async {
    final response = await _client
        .from('CANCHA')
        .select(
          '*, COMPLEJO(*, USUARIO(*, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))))',
        )
        .eq('idComplejo', complejoId);

    return (response as List).map(_canchaWithSupabaseImage).toList();
  }

  @override
  Future<List<Cancha>> fetchAllCanchas() async {
    final response = await _client
        .from('CANCHA')
        .select(
          '*, COMPLEJO(*, USUARIO(*, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))))',
        );
    return (response as List).map(_canchaWithSupabaseImage).toList();
  }

  @override
  Future<Cancha> fetchCancha(int canchaId) async {
    final response = await _client
        .from('CANCHA')
        .select(
          '*, COMPLEJO(*, USUARIO(*, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))))',
        )
        .eq('idCancha', canchaId)
        .single();

    return _canchaWithSupabaseImage(response);
  }

  @override
  Future<void> storeCancha(Cancha cancha) async {
    try {
      await _client.from('CANCHA').insert(_canchaToSupabaseJson(cancha));
    } catch (e) {
      throw Exception("Error al guardar la cancha: $e");
    }
  }

  @override
  Future<void> deleteCancha(int canchaId) async {
    try {
      await _client.from('CANCHA').delete().eq('idCancha', canchaId);
    } catch (e) {
      throw Exception("Error al borrar la cancha: $e");
    }
  }

  @override
  Future<void> updateCancha(Cancha updatedCancha) async {
    try {
      await _client
          .from('CANCHA')
          .update(_canchaToSupabaseJson(updatedCancha))
          .eq('idCancha', updatedCancha.idCancha!);
    } catch (e) {
      throw Exception("Error al actualizar la cancha: $e");
    }
  }

  //Convierte las rutas relativas de las imagenes en rutas absoltuas.
  Cancha _canchaWithSupabaseImage(dynamic json) {
    if (json['imagenCancha'] != null) {
      json['imagenCancha'] = _bucketUrlCancha + json['imagenCancha'];
    }

    if (json['COMPLEJO']['logoCancha'] != null) {
      json['COMPLEJO']['logoCancha'] =
          _bucketUrlComplejo + json['COMPLEJO']['logoCancha'];
    }

    return Cancha.fromJson(json);
  }

  //Convierte la ruta absoluta de la imagen a una relativa.
  Map<String, dynamic> _canchaToSupabaseJson(Cancha cancha) {
    Map<String, dynamic> json = cancha.toDbJson();
    final imageAbsolutePath = json['imagenCancha'] as String?;

    if (imageAbsolutePath != null) {
      json['imagenCancha'] = imageAbsolutePath.replaceAll(_bucketUrlCancha, '');
    }

    return json;
  }
  
  @override
  Future<void> insertCanchas(Cancha cancha) {
    // TODO: implement insertCanchas
    throw UnimplementedError();
  }
  
  

  

  @override
  Future<List<Cancha>> fetchCanchasByDuenio(String idUsuario) async {
  //para extrar el idUsuario del currentUser
  //final idUsuario = Supabase.instance.client.auth.currentUser!.id;

  
  final complejoResponse = await Supabase.instance.client
      .from('COMPLEJO')
      .select('idComplejo')
      .eq('idDuenio', idUsuario)
      .single();

  final idComplejo = complejoResponse['idComplejo'];

  
  return await fetchCanchaByComplejo(idComplejo);
}


  
}
