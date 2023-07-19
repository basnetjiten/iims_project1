import 'package:auto_route/annotations.dart';
import 'package:awesome_app_iims/core/utils/shared_pref.dart';
import 'package:awesome_app_iims/features/login/presentation/login_page.dart';
import 'package:awesome_app_iims/features/registration/service_class/register_user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  late TextEditingController mapController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    mapController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.green),
                  hintText: 'Please enter your unique username',
                  hintStyle: const TextStyle(color: Colors.purple),
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
                      color: Colors.green,
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
                ),
                validator: (userData) {
                  if ((userData?.isEmpty) ?? true) {
                    return 'Username is required field';
                  } else if (userData!.length < 6) {
                    return 'Username must be greater than 6 digit';
                  }
                  return null;
                },
                // onChanged: (userData) {
                //   print(userData);
                //
                //   _username = userData;
                // },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: 'Please enter your first name',
                    hintStyle: TextStyle(color: Colors.purple)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: 'Please enter your last name',
                    hintStyle: TextStyle(color: Colors.purple)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: 'Please enter your password',
                    hintStyle: TextStyle(color: Colors.purple)),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  //  if (_formKey.currentState!.validate()) {

                  PreferenceUtils.storeFieldValue(
                      'username', _userNameController.text);
                  PreferenceUtils.storeFieldValue(
                      'firstName', _firstNameController.text);
                  PreferenceUtils.storeFieldValue(
                      'lastName', _lastNameController.text);
                  PreferenceUtils.storeFieldValue(
                      'password', _passwordController.text);

                  DatabaseService().addStudent(
                    username: _userNameController.text,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    password: _passwordController.text,
                  );

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));

                  //}
                },
                child: const Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
