import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners(); // 🔄 Notifica a los widgets que escuchen
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }
}
