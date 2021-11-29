import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_bloc.dart';
import 'package:planthome/views/login/presentacion/page/ui/pt_container_login.dart';
import 'package:planthome/views/login/presentacion/page/ui/widgets/green_grandient_bacground.dart';
import 'package:planthome/views/registro_usuario/presentacion/page/registro_usuario_page.dart';







import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_bloc.dart';
import 'package:planthome/views/login/presentacion/page/ui/pt_container_login.dart';
import 'package:planthome/views/login/presentacion/page/ui/widgets/green_grandient_bacground.dart';
import 'package:planthome/views/registro_usuario/presentacion/page/registro_usuario_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          //Metodo para ocultar el teclado tocando en la pantalla
          FocusScope.of(context).unfocus();
        },
        child: GreenGradientBackground(
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BlocProvider<LoginBloc>(
                    create: (_) => sl<LoginBloc>(),
                    child: const PtContainerLogin(),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    // width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Registrarse',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsive.dp(14),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistroUsuarioPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
