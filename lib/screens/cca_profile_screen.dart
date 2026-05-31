import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/components/info_text.dart';
import 'package:reserva_cancha/components/reserva_display.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/model/usuario.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';
import 'package:reserva_cancha/providers/usuarios_provider.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class CCAProfileScreen extends StatefulWidget {
  const CCAProfileScreen({super.key});

  @override
  State<CCAProfileScreen> createState() => _CCAProfileScreenState();
}

class _CCAProfileScreenState extends State<CCAProfileScreen> {
  @override
  void initState() {
    super.initState();
    String? uuid = AuthService().currentUserUuid;

    if (uuid != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<UsuariosProvider>().loadUsuarioByUuid(uuid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UsuariosProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Perfil")),
      body: _buildBody(provider, context),
    );
  }

  Widget _buildBody(UsuariosProvider provider, BuildContext ctx) {
    final ctxColors = ColorScheme.of(ctx);
    final ctxTexts = TextTheme.of(ctx);

    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Text(
          "Error: {$provider.error}",
          style: ctxTexts.titleLarge!.copyWith(color: ctxColors.error),
        ),
      );
    }

    if (provider.user == null) {
      return Center(
        child: Text(
          "Error: Tu sesión no es válida.",
          style: ctxTexts.titleLarge!.copyWith(color: ctxColors.error),
        ),
      );
    }

    return _ProfileScreen(user: provider.user!);
  }
}

class _ProfileScreen extends StatelessWidget {
  final Usuario user;

  const _ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    final ctxColors = ColorScheme.of(context);
    final ctxTexts = TextTheme.of(context);

    Color profileColor = Color(user.idUsuario.hashCode).withAlpha(255);
    Color fgProfileColor = profileColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 78,
                backgroundColor: ctxColors.primary,
                child: CircleAvatar(
                  backgroundColor: profileColor,
                  foregroundColor: fgProfileColor,
                  radius: 75,
                  child: Text(
                    user.nombreUsuario.substring(0, 2).toUpperCase(),
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "¡Hola, ${user.nombreUsuario}!",
                style: ctxTexts.headlineLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecorations.regularContainer(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mis Datos",
                      style: ctxTexts.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InfoText(
                      label: 'Correo',
                      value: user.correoUsuario,
                      icon: Icons.mail,
                    ),
                    InfoText(
                      label: 'Teléfono',
                      value: user.telefonoUsuario ?? 'No',
                      icon: Icons.phone,
                    ),
                    InfoText(
                      label: 'Dirección',
                      value: user.direccionUsuario,
                      icon: Icons.location_on,
                    ),
                    InfoText(
                      label: 'Localidad',
                      value:
                          "${user.localidad.localidad}, ${user.localidad.provincia.provincia}",
                      icon: Icons.location_city,
                    ),
                    InfoText(
                      label: 'País',
                      value: user.localidad.provincia.pais.pais,
                      icon: Icons.public,
                    ),
                    InfoText(
                      label: 'Fecha Registro',
                      value: DateFormat('dd/MM/yyyy').format(user.fechaAlta),
                      icon: Icons.calendar_month,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ReservasDisplay(title: "Mis Reservas", uuidUser: user.idUsuario,),
              const SizedBox(height: 8),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<UsuariosProvider>().clear();
                    context.read<ReservasProvider>().clear();
                    AuthService().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (_) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ctxColors.primary,
                    foregroundColor: ctxColors.onPrimary,
                    textStyle: ctxTexts.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Cerrar Sesión"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
