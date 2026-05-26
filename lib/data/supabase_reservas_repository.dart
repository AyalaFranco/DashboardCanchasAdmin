import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseReservasRepository implements ReservasRepository {
  final _client = Supabase.instance.client;

  final String selectQuery = """
      *, 
      TURNO!inner(
        *, 
        CONFIGURACIONPRECIOS(*),
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
    """;

  @override
  Future<List<Reserva>> fetchAllReservas() async {
    final response = await _client.from('RESERVA').select(selectQuery);

    return (response as List).map((json) => Reserva.fromJson(json)).toList();
  }

  @override
  Future<List<Reserva>> fetchReservasOfUser(String uuidUser) async {
    final response = await _client
        .from('RESERVA')
        .select(selectQuery)
        .eq('idUsuario', uuidUser);

    return (response as List).map((json) => Reserva.fromJson(json)).toList();
  }

  @override
  Future<List<Reserva>> fetchReservasOfCancha(int canchaId) async {
    final response = await _client
        .from('RESERVA')
        .select(selectQuery)
        .eq('TURNO.idCancha', canchaId);

    return (response as List).map((json) => Reserva.fromJson(json)).toList();
  }
}
