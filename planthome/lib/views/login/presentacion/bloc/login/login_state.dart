

import 'package:planthome/views/login/data/model/login.dart';


import 'package:planthome/views/login/data/model/login.dart';

abstract class LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final Login loginRespues;

  LoginLoaded(this.loginRespues);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
