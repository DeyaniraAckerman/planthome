import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/menu/presentacion/bloc/menu_bloc.dart';
import 'package:planthome/views/menu/presentacion/bloc/menu_state.dart';

class PtMenuContainer extends StatefulWidget {
  @override
  _PtMenuContainer createState() => _PtMenuContainer();
}

class _PtMenuContainer extends State<PtMenuContainer> {
  late Responsive responsive;
  late Session session;
  final double horizontalContentPadding = 17;

  Future<void> consultarUsuario(int id) async {
    await context.read<MenuBloc>().getUsuarios(id);
  }

  @override
  void initState() {
    super.initState();
    session = sl<Session>();
    consultarUsuario(session.id);
  }

  @override
  Widget build(BuildContext context) {
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
    responsive = Responsive(context);
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is MenuError) {
          showInSnackBar(state.message);
        }
      },
      builder: (context, state) {
        if (state is MenuLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MenuLoaded) {
          return Container(
            padding: const EdgeInsets.only(top: 5, right: 40, left: 40),
            child: Column(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: const AssetImage('assets/PlantHome_logo.png'),
                      height: responsive.dp(100),
                      width: responsive.dp(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Nombre: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.loginRespues.nombre,
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Apellido paterno: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.loginRespues.apellidoPa,
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Apellido materno: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.loginRespues.nombre,
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Sexo: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.loginRespues.idSexo.toString(),
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Fecha nacimiento: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat("dd-MM-yyyy").format(DateTime.parse(
                          state.loginRespues.nacimiento.toString())),
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Usuario: ',
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.loginRespues.usuario,
                      style: TextStyle(
                        fontSize: responsive.dp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                ),
                SizedBox(
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
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
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  void showInSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(mensaje),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.black,
        onPressed: () {},
      ),
    ));
  }
}
