import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';

class CanchasProvider extends ChangeNotifier {
  final CanchasRepository repository;

  CanchasProvider({required this.repository});

  Cancha? _selectedCancha;
  List<Cancha> _canchas = [];
  List<Cancha> _canchasFiltradas = [];
  bool _isBusy = false;
  String? _error;

  Cancha? get selectedCancha => _selectedCancha;
  List<Cancha> get canchasList => _canchasFiltradas;
  bool get isBusy => _isBusy;
  String? get error => _error;

  Future<void> loadAllCanchas() async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      _canchas = await repository.fetchAllCanchas();
      _canchasFiltradas = _canchas;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<void> loadCanchasOfComplejo(int complejoId) async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      _canchas = await repository.fetchCanchaByComplejo(complejoId);
      _canchasFiltradas = _canchas;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<void> loadCancha(int canchaId) async {
    _isBusy = true;
    _selectedCancha = null;
    _error = null;
    notifyListeners();

    try {
      _selectedCancha = await repository.fetchCancha(canchaId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<bool> storeCancha(Cancha cancha) async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      await repository.storeCancha(cancha);
      loadAllCanchas();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<bool> updateCancha(Cancha updatedCancha) async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      await repository.updateCancha(updatedCancha);
      loadAllCanchas();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<bool> deleteCancha(int idCancha) async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      await repository.deleteCancha(idCancha);
      loadAllCanchas();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isBusy = false;
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
