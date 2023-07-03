import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/core/router.gr.dart';
import 'package:awesome_app_iims/core/utils/shared_pref.dart';
import 'package:awesome_app_iims/features/home/presentation/home_page.dart';
import 'package:awesome_app_iims/features/profile/profile_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

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
                decoration: InputDecoration(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Please enter your username',
                  label: const Text(
                    'Username',
                  ),
                ),
                onChanged: (userData) {
                  _username = userData;
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
                decoration: InputDecoration(
                  hintText: 'Please enter your password',
                  label: const Text(
                    'Password',
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (userInputPassword) {
                  if (userInputPassword != null &&
                      userInputPassword.trim().isEmpty) {
                    return 'Password is required field';
                  } else if (userInputPassword!.length < 5) {
                    return 'Password must be greater than 10 character';
                  }
                  return null;
                },
                onChanged: (passwordInput) {
                  _password = passwordInput;
                },
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final String storedUserName =
                        PreferenceUtils.getString('username');
                    final String storedPassword =
                        PreferenceUtils.getString('password');

                    if (storedPassword == _password &&
                        _username == storedUserName) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Center(
                            child: Text('Invalid username or password'),
                          ),
                        ),
                      );
                    }
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
