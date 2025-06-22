import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/profileScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/scheduleScreen.dart';
import 'widgets/customNavbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Menu App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(), // Página con navegación
      debugShowCheckedModeBanner: false,
    );
  }
}

// Página principal con tabs
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isLoggedIn = false; // 👈 Simulación de sesión

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ScheduleScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  // Función para iniciar sesión
  void _handleLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 👇 Mostrar Login si no ha iniciado sesión
    if (!_isLoggedIn) {
      return LoginScreen(onLoginSuccess: _handleLoginSuccess);
    }

    return Scaffold(
      body: _screens[_selectedIndex], // Cambia pantalla
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
