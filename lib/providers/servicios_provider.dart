import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/servicio.dart';
import 'package:reserva_cancha/model/servicios_repository.dart';

class ServiciosProvider extends ChangeNotifier {
  final ServiciosRepository repository;
  ServiciosProvider({required this.repository});

  Map<int, List<Servicio>> _complejoServiciosCache = {};
  List<Servicio> _allServiciosCache = [];

  List<Servicio> _servicios = [];
  bool _isBusy = false;
  String? _error;

  List<Servicio> get servicios => _servicios;
  bool get isBusy => _isBusy;
  String? get error => _error;

  Future<void> loadAllServicios() async {
    if (_allServiciosCache.isNotEmpty) {
      _servicios = _allServiciosCache;
      notifyListeners();
      return;
    }

    return _loadServicios(
      fetcher: () => repository.fetchAllServicios(),
      cacher: () => _allServiciosCache = _servicios,
    );
  }

  Future<void> loadServiciosOfComplejo(int complejoId) async {
    if (_complejoServiciosCache.containsKey(complejoId)) {
      _servicios = _complejoServiciosCache[complejoId]!;
      _error = null;
      notifyListeners();
      return;
    }

    return _loadServicios(
      fetcher: () => repository.fetchServiciosOfComplejo(complejoId),
      cacher: () => _complejoServiciosCache[complejoId] = _servicios,
    );
  }

  void clearCache() {
    _allServiciosCache.clear();
    _complejoServiciosCache.clear();
  }

  Future<void> _loadServicios({
    required Future<List<Servicio>> Function() fetcher,
    required void Function() cacher,
  }) async {
    _isBusy = true;
    _error = null;
    notifyListeners();

    try {
      _servicios = await fetcher();
      cacher();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }
}
