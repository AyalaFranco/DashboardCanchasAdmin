class AuthUsers{
  final int idUsuario;

  AuthUsers({
    required this.idUsuario
  });

  factory AuthUsers.fromJson(Map<String, dynamic> json) {
    return AuthUsers(
      idUsuario: json['idUsuario'],
    );
  }
  
}