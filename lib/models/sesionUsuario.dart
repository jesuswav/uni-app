// ignore: file_names
class UserSession {
  final String email;
  //inal String nombre;
  final bool isLoggedIn;

  UserSession({
    required this.email,
    //required this.nombre,
    required this.isLoggedIn,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    //'nombre': nombre,
    'isLoggedIn': isLoggedIn,
  };

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      email: json['email'],
      //nombre: json['nombre'],
      isLoggedIn: json['isLoggedIn'],
    );
  }
}
