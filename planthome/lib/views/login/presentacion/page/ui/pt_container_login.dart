import 'package:flutter/material.dart';
import 'package:flutter/services.dart';







import 'package:provider/src/provider.dart';

import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/dialogs.dart';
import 'package:planthome/core/ui/pt_input_decoration.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_bloc.dart';
import 'package:planthome/views/principal/page/principal_page.dart';

class PtContainerLogin extends StatefulWidget {
  const PtContainerLogin({Key? key}) : super(key: key);

  @override
  _PtContainerLogin createState() => _PtContainerLogin();
}

class _PtContainerLogin extends State<PtContainerLogin> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final double horizontalContentPadding = 17;
  String? _user;
  String? _password;
  bool isObscure = true;
  late Responsive responsive;

  Future<void> login(String usuario, String contrasena) async {
    await context.read<LoginBloc>().iniciarSesion(usuario, contrasena);
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.orange,
      shape: const StadiumBorder(),
      side: Colors.orange != null
          ? const BorderSide(
              color: Colors.orange,
              width: 2,
            )
          : null,
    );
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: double.infinity,
              child: Image(
                image: const AssetImage('assets/PlantHome_logo.png'),
                height: responsive.dp(210),
                width: responsive.dp(100),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.dp(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Correo de Usuario',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(14),
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _userController,
            onChanged: (s) {
              if (s.isNotEmpty) {}
            },
            autofocus: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: PtInputDecoration.inputDecoration(
              hintText: "Ingresar Correo",
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            'Contraseña',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(14),
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _passwordController,
            onChanged: (s) {
              _password = s;
            },
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            enableIMEPersonalizedLearning: false,
            enableInteractiveSelection: false,
            obscureText: isObscure,
            keyboardType: TextInputType.visiblePassword,
            decoration: PtInputDecoration.inputDecoration(
              hintText: 'Ingresar tu contraseña',
              suffixIcon: IconButton(
                icon: Icon(isObscure == true
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_userController.value.text.trim().isNotEmpty &&
                  _passwordController.value.text.trim().isNotEmpty) {
                print(_userController.value.text +
                    _passwordController.value.text);
                login(
                    _userController.value.text, _passwordController.value.text);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const PrincipalPage()),
                );
              } else {
                Dialogs.Alertfunction(context,
                    title: 'Error',
                    description:
                    'Campos Vacios favor de llenar todos los campos',
                    function: () {
                      Navigator.pop(context);
                    });
              }
            },
            style: style,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 17,
                horizontal: horizontalContentPadding,
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calibri',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
