import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/localidad.dart';
import 'package:reserva_cancha/model/localidades_repository.dart';

class LocalidadesProvider extends ChangeNotifier {
  final LocalidadesRepository repository;

  LocalidadesProvider({required this.repository});

  List<Pais> _paises = [];
  List<Provincia> _provincias = [];
  List<Localidad> _localidades = [];
  _ProviderStatus _status = _ProviderStatus.idle;
  String? _error;

  List<Pais> get paises => _paises;
  List<Provincia> get provincias => _provincias;
  List<Localidad> get localidades => _localidades;

  bool get isBusy => _status != _ProviderStatus.idle;
  bool get isLoadingPaises => _status == _ProviderStatus.loadingPaises;
  bool get isLoadingProvincias => _status == _ProviderStatus.loadingProvincias;
  bool get isLoadingLocalidades => _status == _ProviderStatus.loadingLocalidades;
  String? get error => _error;

  Future<void> loadAllPaises() async {
    if (_paises.isNotEmpty) {
      notifyListeners();
      return;
    }

    _status = _ProviderStatus.loadingPaises;
    _error = null;
    notifyListeners();

    try {
      _paises = await repository.fetchAllPaises();
    } catch (e) {
      _error = e.toString();
    } finally {
      _status = _ProviderStatus.idle;
      notifyListeners();
    }
  }

  Future<void> loadProvinciasOfPais(int paisId) async {
    _status = _ProviderStatus.loadingProvincias;
    _error = null;
    notifyListeners();

    try {
      _provincias = await repository.fetchProvinciasByPais(paisId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _status = _ProviderStatus.idle;
      notifyListeners();
    }
  }

  Future<void> loadLocalidadesOfProvincia(int provinciaId) async {
    _status = _ProviderStatus.loadingLocalidades;
    _error = null;
    notifyListeners();

    try {
      _localidades = await repository.fetchLocalidadesByProvincia(provinciaId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _status = _ProviderStatus.idle;
      notifyListeners();
    }
  }
}

enum _ProviderStatus {
  idle,
  loadingPaises,
  loadingProvincias,
  loadingLocalidades
}
