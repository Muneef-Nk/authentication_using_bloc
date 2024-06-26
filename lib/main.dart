import 'package:authentication_using_bloc/blocs/auth/auth_bloc.dart';
import 'package:authentication_using_bloc/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
