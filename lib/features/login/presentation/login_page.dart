import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Please enter your username',
                  label: Text(
                    'Username',
                  ),
                ),
                onChanged: (userData) {
                  username = userData;
                },
                validator: (userInputData) {
                  if (userInputData != null && userInputData.trim().isEmpty) {
                    return 'User name is required field';
                  } else if (userInputData!.length < 6) {
                    return 'Username must be greater than 6 character';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Please enter your password',
                  label: Text(
                    'Password',
                  ),
                ),
                validator: (userInputPassword) {
                  if (userInputPassword != null &&
                      userInputPassword.trim().isEmpty) {
                    return 'Password is required field';
                  } else if (!userInputPassword!.contains('@')) {
                    return 'Password must contain @ character';
                  } else if (userInputPassword.length < 10) {
                    return 'Password must be greater than 10 character';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(username);
                  }
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
