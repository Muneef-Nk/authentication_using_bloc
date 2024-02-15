import 'package:authentication_using_bloc/blocs/auth/auth_bloc.dart';
import 'package:authentication_using_bloc/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${state.error}")));
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${state.success}")));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Homescreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "email"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "password"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoginRequested(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                    },
                    child: Text("Login"))
              ],
            ),
          );
        },
      ),
    );
  }
}
