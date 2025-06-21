import 'package:flutter/material.dart';
import '../core/theme.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginScreen({required this.onLoginSuccess, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isRegistered = true;

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simular una espera de autenticación
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _isLoading = false);

        print(_emailController.text);
        print(_passwordController.text);

        // Simulación exitosa
        widget.onLoginSuccess();
      });
    }
  }

  void _submitRegiser() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simular una espera de autenticación
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _isLoading = false);

        // Simulación exitosa
        widget.onLoginSuccess();
      });
    }
  }

  // Nivel de opacidad para la animación
  double opacityLevel = 0.0;

  void _toggleForm() {
    // Estado de opacidad en o antes de activarlo de nuevo
    setState(() {
      opacityLevel = 0.0;
    });
    // cambiar entre Login y Register
    setState(() {
      _isRegistered = !_isRegistered;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0; // se activa sin un booleano
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(milliseconds: 500),
          child: Text(_isRegistered ? "Iniciar sesión" : 'Registrarse'),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacityLevel,
        duration: Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: _isRegistered
                ? LoginForm(
                    onLogin: _submitLogin,
                    isLoading: _isLoading,
                    onSwitch: _toggleForm,
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  )
                : RegisterForm(
                    onRegister: _submitRegiser,
                    isLoading: _isLoading,
                    onSwitch: _toggleForm,
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
          ),
        ),
      ),
    );
  }
}

// LOGIN FORM WIDGET

class LoginForm extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSwitch;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    required this.onLogin,
    required this.onSwitch,
    required this.isLoading,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // 👈 Aquí ahora sí usas el formKey
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Bienvenido", style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),

            Image.asset(
              'assets/logoutc-app.png',
              height: 120,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: emailController,
              decoration: greyInputDecoration.copyWith(
                hintText: 'Correo Institucional',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu correo';
                }
                final emailRegex = RegExp(r'^[\w\.-]+@utcalvillo\.edu\.mx$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Correo inválido. Usa solo @utcalvillo.edu.mx';
                }
                return null;
              },
            ),
            SizedBox(height: 22),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: greyInputDecoration.copyWith(hintText: 'Contraseña'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu contraseña';
                }
                final RegExp passwordRegex = RegExp(
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
                );
                if (!passwordRegex.hasMatch(value)) {
                  return 'La contraseña debe tener:\n- Mayúscula\n- Minúscula\n- Número\n- Símbolo\n- Mín. 8 caracteres';
                }
                return null;
              },
            ),

            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: double.infinity,
                height: 1.5,
                color: AppColors.primary500,
              ),
            ),
            SizedBox(height: 22),

            isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary500,
                    ),
                    backgroundColor: Colors.grey.shade200,
                    strokeWidth: 6.0,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onLogin,
                          style: myButtonStyle(),
                          child: Text("Entrar"),
                        ),
                      ),
                    ],
                  ),

            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: onSwitch,
                child: Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: AppColors.primary500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// REGISTER FORM WIDGET

class RegisterForm extends StatelessWidget {
  final VoidCallback onRegister;
  final VoidCallback onSwitch;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  const RegisterForm({
    required this.onRegister,
    required this.onSwitch,
    required this.isLoading,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // 👈 Aquí ahora sí usas el formKey
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Bienvenido", style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),

            Image.asset(
              'assets/logoutc-app.png',
              height: 120,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: nameController,
              decoration: greyInputDecoration.copyWith(hintText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu nombre';
                }
                return null;
              },
            ),

            SizedBox(height: 22),

            TextFormField(
              controller: emailController,
              decoration: greyInputDecoration.copyWith(
                hintText: 'Correo Institucional',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu correo';
                }
                final emailRegex = RegExp(r'^[\w\.-]+@utcalvillo\.edu\.mx$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Correo inválido. Usa solo @utcalvillo.edu.mx';
                }
                return null;
              },
            ),

            SizedBox(height: 22),

            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: greyInputDecoration.copyWith(hintText: 'Contraseña'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu contraseña';
                }
                final RegExp passwordRegex = RegExp(
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
                );
                if (!passwordRegex.hasMatch(value)) {
                  return 'La contraseña debe tener:\n- Mayúscula\n- Minúscula\n- Número\n- Símbolo\n- Mín. 8 caracteres';
                }
                return null;
              },
            ),

            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: double.infinity,
                height: 1.5,
                color: AppColors.primary500,
              ),
            ),
            SizedBox(height: 22),

            isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary500,
                    ),
                    backgroundColor: Colors.grey.shade200,
                    strokeWidth: 6.0,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onRegister,
                          style: myButtonStyle(),
                          child: Text("Entrar"),
                        ),
                      ),
                    ],
                  ),

            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: onSwitch,
                child: Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: AppColors.primary500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
