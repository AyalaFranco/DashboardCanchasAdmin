import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';

class ReservasProvider extends ChangeNotifier {
  final ReservasRepository repository;

  ReservasProvider({required this.repository});

  List<Reserva> _reservas = [];
  List<Reserva> _reservasFiltradas = [];
  bool _isLoading = false;
  String? _error;

  List<Reserva> get reservas => _reservasFiltradas;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadReservas() async {
    return _load(() => repository.fetchAllReservas());
  }

  Future<void> loadReservasOfUser(String uuidUser) async {
    return _load(() => repository.fetchReservasOfUser(uuidUser));
  }

  Future<void> loadReservasOfCancha(int canchaId) async {
    return _load(() => repository.fetchReservasOfCancha(canchaId));
  }

  void clear() {
    _reservas.clear();
    _reservasFiltradas.clear();
  }

  void filterReservas({bool filterFinished = false}) {
    _reservasFiltradas = _reservas;

    if (filterFinished) {
      DateTime now = DateTime.now();

      _reservasFiltradas = _reservasFiltradas
          .where(
            (reserva) => reserva.turno.fechaFinTurno.isAfter(now),
          )
          .toList();
    }

    notifyListeners();
  }

  Future<void> _load(Future<List<Reserva>> Function() fetcher) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _reservas = await fetcher();
      _reservasFiltradas = _reservas;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}