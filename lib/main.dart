import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/profileScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/scheduleScreen.dart';
import 'widgets/customNavbar.dart';
import './core/theme.dart';

// Provider
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'provider/appState.dart';

// guardar la sesión
import './models/sesionUsuario.dart';
import 'package:uni_app/services/sessionService.dart';

void main() async {
  // iniciar Shared_references
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(create: (_) => AppState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.background,
      ),
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
  bool? _isLoggedIn; // 👈 Simulación de sesión
  String _emailFromChild = '';

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      _verificarSesion();
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    ScheduleScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  // Función para guardar la sesión
  Future<void> _handleLoginSuccess() async {
    // datos para el usuario
    final usuario = UserSession(
      email: _emailFromChild,
      //nombre: 'Juan Pérez',
      isLoggedIn: true,
    );
    // guardar la sesión por medio del servicio
    await SessionService.guardarSesion(usuario);

    // Obtener sesión
    final session = await SessionService.obtenerSesion();
    // guardar la sesion en el objeto que se evalua para renderizar  o no el login
    setState(() {
      _isLoggedIn = session?.isLoggedIn;
    });
  }

  Future<void> _verificarSesion() async {
    // Obtener sesión
    final session = await SessionService.obtenerSesion();
    // guardar la sesion en el objeto que se evalua para renderizar  o no el login
    setState(() {
      _isLoggedIn = session?.isLoggedIn;
    });
  }

  void updateEmailFromChild(String nuevo) {
    setState(() {
      _emailFromChild = nuevo;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 👇 Mostrar Login si no ha iniciado sesión
    // 🟡 Mostrar loader mientras se verifica
    if (_isLoggedIn == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary500),
            backgroundColor: Colors.white38,
            strokeWidth: 6.0,
          ),
        ),
      );
    }

    // 🔴 Mostrar Login solo si NO hay sesión activa
    if (_isLoggedIn == false) {
      return LoginScreen(
        onLoginSuccess: _handleLoginSuccess,
        updateEmailFromChild: updateEmailFromChild,
      );
    }

    // ✅ Mostrar app normalmente
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
