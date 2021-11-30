import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/page/ui/widgets/green_grandient_bacground.dart';
import 'package:planthome/views/menu/presentacion/bloc/menu_bloc.dart';
import 'package:planthome/views/menu/presentacion/page/ui/pt_menu_container.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
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
              child: BlocProvider<MenuBloc>(
            create: (_) => sl<MenuBloc>(),
            child: ListView(
              children: <Widget>[
                PtMenuContainer(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
