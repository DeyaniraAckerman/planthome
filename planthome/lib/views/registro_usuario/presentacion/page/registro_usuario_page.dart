import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/page/ui/widgets/green_grandient_bacground.dart';
import 'package:planthome/views/registro_usuario/presentacion/bloc/registro/registro_usuario_bloc.dart';
import 'package:planthome/views/registro_usuario/presentacion/page/ui/pt_container_registro_usuario.dart';

class RegistroUsuarioPage extends StatefulWidget {
  const RegistroUsuarioPage({Key? key}) : super(key: key);

  @override
  _RegistroUsuarioPage createState() => _RegistroUsuarioPage();
}

class _RegistroUsuarioPage extends State<RegistroUsuarioPage> {
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: responsive.dp(10)),
      ),
      body: GreenGradientBackground(
        child: GestureDetector(
          onTap: () {
            //Metodo para ocultar el teclado tocando en la pantalla
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
              child: ListView(
            children: <Widget>[
              BlocProvider<RegistroUsuarioBloc>(
                create: (_) => sl<RegistroUsuarioBloc>(),
                child: PtContainerRegistroUsuario(),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
