import 'package:flutter/material.dart';
import 'package:reserva_cancha/model/usuario.dart';
import 'package:reserva_cancha/model/usuarios_repository.dart';

class UsuariosProvider extends ChangeNotifier {
  final UsuariosRepository repository;

  UsuariosProvider({required this.repository});

  Usuario? _user;
  bool _isLoading = false;
  String? _error;
  Map<String, Usuario> _userCache = {};

  Usuario? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUsuarioByUuid(String uuid) async {
    if (_userCache.containsKey(uuid)) {
      _user = _userCache[uuid];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await repository.fetchUsuarioByUuid(uuid);

      if (_user == null) {
        throw ('No se encontró ningún usuario');
      }

      _userCache[uuid] = _user!;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _user = null;
    _userCache.clear();
  }
}