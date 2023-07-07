import 'package:auto_route/annotations.dart';
import 'package:awesome_app_iims/features/home/presentation/home_page.dart';
import 'package:awesome_app_iims/features/login/presentation/blocs/auth_check_cubit.dart';
import 'package:awesome_app_iims/features/registration/presentation/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthCheckCubit _authCheckCubit;

  @override
  void initState() {
    super.initState();
    _authCheckCubit = context.read<AuthCheckCubit>()..isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCheckCubit, bool>(
      bloc: _authCheckCubit,
      listener: (context, isLoggedIn) {
        print("IS LOGGED IN $isLoggedIn");
        if (isLoggedIn) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegistrationPage()));
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text(
            'Netflix',
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
