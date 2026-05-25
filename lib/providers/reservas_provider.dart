import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';

class ReservasProvider extends ChangeNotifier {
  final ReservasRepository repository;

  ReservasProvider({required this.repository});

  List<Reserva> _reservas = [];
  bool _isLoading = false;
  String? _error;

  List<Reserva> get reservas => _reservas;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadReservas() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _reservas = await repository.fetchAllReservas();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
