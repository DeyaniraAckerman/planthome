import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planthome/core/ui/dialogs.dart';
import 'package:planthome/core/ui/pt_elevated_button.dart';
import 'package:planthome/core/ui/pt_input_decoration.dart';
import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/views/login/presentacion/page/login_page.dart';
import 'package:planthome/views/registro_usuario/data/model/Sexo.dart';
import 'package:planthome/views/registro_usuario/data/model/UsuarioCreate.dart';
import 'package:planthome/views/registro_usuario/presentacion/bloc/registro/registro_usuario_bloc.dart';
import 'package:planthome/views/registro_usuario/presentacion/bloc/registro/registro_usuario_state.dart';



class PtContainerRegistroUsuario extends StatefulWidget {
  @override
  _PtContainerRegistroUsuario createState() => _PtContainerRegistroUsuario();
}

class _PtContainerRegistroUsuario extends State<PtContainerRegistroUsuario> {
  late Responsive responsive;
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _apellidoPaterno = TextEditingController();
  final TextEditingController _apellidoMaterno = TextEditingController();
  final TextEditingController _fechaNacimiento = TextEditingController();
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();
  bool isObscure = true;
  final double horizontalContentPadding = 17;
  String? _password;
  late List<UsuariosCreate> items;
  Sexo? _selectedValue;
  late List<Sexo> sexos;

  Future<void> _getSexo() async {
    sexos = (await context.read<RegistroUsuarioBloc>().consultarSexo())!;
  }

  Future<void> registroUsuario(UsuariosCreate crearUsuario) async {
    await context.read<RegistroUsuarioBloc>().RegistrarUsuario(crearUsuario);
  }

  @override
  void initState() {
    super.initState();
    _getSexo();
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
    return BlocConsumer<RegistroUsuarioBloc, RegistroUsuarioState>(
      listener: (context, state) {
        if (state is RegistroUsuarioError) {
          showInSnackBar(state.message);
        }
      },
      builder: (context, state) {
        if (state is RegistroUsuarioLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RegistroUsuarioLoaded) {
          return Container(
            padding: EdgeInsets.all(responsive.dp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Nombre:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _nombre,
                  onChanged: (s) {
                    if (s.isNotEmpty) {}
                  },
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: PtInputDecoration.inputDecoration(
                    hintText: "Ingresar Nombre",
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Apellido Paterno:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _apellidoPaterno,
                  onChanged: (s) {
                    if (s.isNotEmpty) {}
                  },
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: PtInputDecoration.inputDecoration(
                    hintText: "Ingresar Apellido Paterno",
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Apellido Materna:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _apellidoMaterno,
                  onChanged: (s) {
                    if (s.isNotEmpty) {}
                  },
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: PtInputDecoration.inputDecoration(
                    hintText: "Ingresar Apellido Paterno",
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Sexo:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                DropdownButtonFormField<Sexo>(
                  isDense: true,
                  hint: const Text('Seleccionar Sexo'),
                  value: _selectedValue,
                  icon: const Icon(Icons.check_circle_outline),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (Sexo? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  items: sexos.map<DropdownMenuItem<Sexo>>((Sexo value) {
                    return DropdownMenuItem<Sexo>(
                      value: value,
                      child: Text(value.nombre),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Fecha nacimiento:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _fechaNacimiento,
                  decoration: PtInputDecoration.inputDecoration(
                    hintText: "Ingresar fecha de nacimiento",
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)))!;

                    _fechaNacimiento.text = date.toIso8601String();
                  },
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Usuario :',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _usuario,
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
                const SizedBox(height: 15.0),
                Text(
                  'Contrasena',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.dp(14),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _contrasena,
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
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    if (_usuario.value.text.trim().isNotEmpty&&
                        _apellidoPaterno.value.text.trim().isNotEmpty &&
                        _apellidoMaterno.value.text.isNotEmpty &&
                        _selectedValue != null &&
                        _fechaNacimiento.value.text.trim().isNotEmpty &&
                        _usuario.value.text.trim().isNotEmpty &&
                        _contrasena.value.text.trim().isNotEmpty) {
                      print(DateTime.parse(_fechaNacimiento.value.text));
                      UsuariosCreate usuarioCreate = UsuariosCreate(
                          _usuario.value.text,
                          _apellidoPaterno.value.text,
                          _apellidoMaterno.value.text,
                          _selectedValue!.id,
                          DateTime.parse(_fechaNacimiento.value.text),
                          _usuario.value.text,
                          _contrasena.value.text);
                      registroUsuario(usuarioCreate);
                      Dialogs.Alertfunction(context,
                          title: 'Exitoso',
                          description: 'Se Registro Exitosamente',
                          function: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      });
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
