import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:planthome/core/data/model/session.dart';
import 'package:planthome/core/service_locator.dart';
import 'package:planthome/core/ui/pt_navigationbar.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/bloc/login/login_bloc.dart';
import 'package:planthome/views/login/presentacion/page/ui/widgets/green_grandient_bacground.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPage createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  late Responsive responsive;
  late Session session;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = sl<Session>();
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.green,
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
                    child: Text(''),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PtNavigationBar(
        posicion: 0,
      ),
    );
  }
}
