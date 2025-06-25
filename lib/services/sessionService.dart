import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sesionUsuario.dart';

class SessionService {
  static const String key = 'sesion';

  static Future<void> guardarSesion(UserSession usuario) async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioJson = jsonEncode(usuario.toJson());
    await prefs.setString(key, usuarioJson);
  }

  static Future<UserSession?> obtenerSesion() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioJson = prefs.getString(key);
    if (usuarioJson == null) return null;
    final Map<String, dynamic> data = jsonDecode(usuarioJson);
    return UserSession.fromJson(data);
  }

  static Future<void> borrarSesion() async {
    print('Borrando sesion');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
