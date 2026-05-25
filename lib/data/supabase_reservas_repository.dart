import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseReservasRepository implements ReservasRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Reserva>> fetchAllReservas() async {
    final response = await _client.from('RESERVA').select("""
        *, TURNO(
          *, CONFIGURACIONPRECIOS(*),
            CANCHA(
              *, COMPLEJO(
                *, USUARIO(
                  *, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))
                )
              )
            )
          ),
          USUARIO(
            *, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))
          )
        """);

    return (response as List).map((json) {
      json['TURNO']['CONFIGURACIONPRECIOS']['CANCHA'] = json['TURNO']['CANCHA'];
      return Reserva.fromJson(json);
    }).toList();
  }
}
