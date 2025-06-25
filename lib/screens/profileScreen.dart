import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'package:flutter/services.dart';
import '../main.dart';
// Provider
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../provider/appState.dart';
// Manejar la sesión
import '../services/sessionService.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = '';

  Future<void> cargarSesion() async {
    final sesion = await SessionService.obtenerSesion();
    setState(() {
      userEmail = sesion!.email;
    });
  }

  @override
  void initState() {
    super.initState();
    cargarSesion();
  }

  @override
  Widget build(BuildContext context) {
    final String name = 'Jaime';
    final String firstLetter = name.substring(0, 1);
    final String registration = 'C3342452';

    Future<void> cerrarSesion() async {
      // Cerrar sesión
      await SessionService.borrarSesion();

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
          (route) => false,
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🧑🏻‍💻 Perfil',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 34),

              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 252,
                      height: 252,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.text50,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(42),
                      child: Text(
                        firstLetter,
                        style: TextStyle(fontSize: 100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              ProfileItem(
                title: 'Correo Institucional',
                content: userEmail,
                message: 'Correo copiado',
              ),
              ProfileItem(
                title: 'Matricula',
                content: registration,
                message: 'Matricula copiada',
              ),

              SizedBox(height: 30),

              TextButton(
                onPressed: cerrarSesion,
                child: const Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    required this.title,
    required this.content,
    required this.message,
    super.key,
  });

  final String title;
  final String content;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.text50,
              borderRadius: BorderRadius.circular(22),
            ),
            padding: EdgeInsets.all(18),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(content),
                  ],
                ),

                Spacer(),

                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: content));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  '$message al portapapeles.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            backgroundColor: AppColors.secondary300,
                            duration: Duration(seconds: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            behavior: SnackBarBehavior
                                .floating, // 👈 Aparece flotando
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            elevation: 6,
                          ),
                        );
                      },
                      child: Text(
                        'Copiar',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
