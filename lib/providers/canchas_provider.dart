import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';

class CanchasProvider extends ChangeNotifier {
  final CanchasRepository repository;

  CanchasProvider({required this.repository});

  List<Cancha> _canchas = [];
  List<Cancha> _canchasFiltradas = [];
  bool _isLoading = false;
  String? _error;

  List<Cancha> get canchas => _canchasFiltradas;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCanchas() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _canchas = await repository.fetchAllCanchas();
      _canchasFiltradas = _canchas;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filtrar(String query) {
    if (query.isEmpty) {
      _canchasFiltradas = _canchas;
    } else {
      _canchasFiltradas = _canchas
          .where(
            (cancha) => cancha.complejo.nombreComplejo.toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    }
    notifyListeners();
  }
}
