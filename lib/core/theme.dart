import 'package:flutter/material.dart';

// COLORES PERSONALIZADOS

class AppColors {
  static const Color primary500 = Color.fromRGBO(
    27,
    48,
    83,
    1,
  ); // Azul personalizado
  static const Color primary100 = Color.fromRGBO(13, 110, 253, 1);
  static const Color text100 = Color.fromRGBO(128, 128, 128, 1);
  static const Color text50 = Color.fromRGBO(236, 236, 236, 0.7);
  static const Color text500 = Color.fromRGBO(33, 37, 41, 1);
  static const Color secondary300 = Color.fromRGBO(159, 195, 76, 1);
  static const Color secondary500 = Color.fromRGBO(151, 192, 31, 1);
}

final InputDecoration greyInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(217, 217, 217, 50), // gris claro
  hintStyle: TextStyle(
    color: Color.fromARGB(255, 75, 75, 75),
  ), // texto gris más oscuro
  labelStyle: TextStyle(color: Colors.grey.shade700),

  // Borde cuando NO está enfocado
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
    borderRadius: BorderRadius.circular(16),
  ),

  // Borde cuando SÍ está enfocado (mismo estilo para que no cambie)
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
    borderRadius: BorderRadius.circular(16),
  ),

  // Opcional: elimina el borde predeterminado cuando no se define otro
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
    borderRadius: BorderRadius.circular(16),
  ),
  contentPadding: EdgeInsets.all(18),
);

ButtonStyle myButtonStyle() {
  return ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 18),
    backgroundColor: Color.fromRGBO(27, 48, 83, 1),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
  );
}
