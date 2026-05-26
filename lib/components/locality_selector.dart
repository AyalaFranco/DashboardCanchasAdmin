import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/model/localidad.dart';
import 'package:reserva_cancha/providers/localidades_provider.dart';

class LocalitySelector extends StatefulWidget {
  final void Function(Localidad?) onSelectedLocalidad;

  const LocalitySelector({super.key, required this.onSelectedLocalidad});

  @override
  State<LocalitySelector> createState() => _LocalitySelectorState();
}

class _LocalitySelectorState extends State<LocalitySelector> {
  Pais? _selectedPais;
  Provincia? _selectedProvincia;
  Localidad? _selectedLocalidad;

  final _provinciaController = TextEditingController();
  final _localidadController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocalidadesProvider>().loadAllPaises();
    });
  }

  @override
  void dispose() {
    _provinciaController.dispose();
    _localidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalidadesProvider>(
      builder: (context, provider, child) {
        if (provider.error != null) {
          return Text(
            "Error: ${provider.error}",
            style: const TextStyle(color: Colors.red),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dropDownPais(provider),
              const SizedBox(height: 16.0,),
              _dropDownProvincia(provider),
              const SizedBox(height: 16.0,),
              _dropDownLocalidad(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _dropDownPais(LocalidadesProvider provider) {
    return DropdownMenu<Pais>(
      enabled: !provider.isLoadingPaises,
      initialSelection: _selectedPais,
      hintText: "Seleccionar país",
      label: const Text("País"),
      requestFocusOnTap: true,
      enableFilter: true,
      menuHeight: 200.0,
      expandedInsets: EdgeInsets.zero,
      onSelected: (Pais? nuevoPais) {
        if (nuevoPais != null) {
          setState(() {
            _selectedPais = nuevoPais;
            _selectedProvincia = null;
            _selectedLocalidad = null;
          });
    
          _provinciaController.clear();
          _localidadController.clear();
          provider.loadProvinciasOfPais(nuevoPais.idPais);
        }
      },
    
      dropdownMenuEntries: provider.paises.map((Pais pais) {
        return DropdownMenuEntry<Pais>(value: pais, label: pais.pais);
      }).toList(),
    );
  }

  Widget _dropDownProvincia(LocalidadesProvider provider) {
    return DropdownMenu<Provincia>(
      controller: _provinciaController,
      enabled: !provider.isLoadingProvincias && _selectedPais != null,
      initialSelection: _selectedProvincia,
      hintText: "Seleccionar provincia",
      label: const Text("Provincia"),
      requestFocusOnTap: true,
      enableFilter: true,
      menuHeight: 200.0,
      expandedInsets: EdgeInsets.zero,
      onSelected: (Provincia? nuevaProvincia) {
        if (nuevaProvincia != null) {
          setState(() {
            _selectedProvincia = nuevaProvincia;
            _selectedLocalidad = null;
          });
    
          _localidadController.clear();
          provider.loadLocalidadesOfProvincia(nuevaProvincia.idProvincia);
        }
      },
    
      dropdownMenuEntries: provider.provincias.map((Provincia provincia) {
        return DropdownMenuEntry<Provincia>(
          value: provincia,
          label: provincia.provincia,
        );
      }).toList(),
    );
  }

  Widget _dropDownLocalidad(LocalidadesProvider provider) {
    return DropdownMenu<Localidad>(
      controller: _localidadController,
      enabled:
          !provider.isLoadingLocalidades &&
          _selectedProvincia != null,
      initialSelection: _selectedLocalidad,
      hintText: "Seleccionar localidad",
      label: const Text("Localidad"),
      requestFocusOnTap: true,
      enableFilter: true,
      menuHeight: 200.0,
      expandedInsets: EdgeInsets.zero,
      onSelected: (Localidad? nuevaLocalidad) {
        if (nuevaLocalidad != null) {
          setState(() {
            _selectedLocalidad = nuevaLocalidad;
          });
          widget.onSelectedLocalidad(nuevaLocalidad);
        }
      },
    
      dropdownMenuEntries: provider.localidades.map((Localidad localidad) {
        return DropdownMenuEntry<Localidad>(
          value: localidad,
          label: localidad.localidad,
        );
      }).toList(),
    );
  }
}
