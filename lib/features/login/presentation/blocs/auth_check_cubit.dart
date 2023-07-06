import 'package:awesome_app_iims/core/utils/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class AuthCheckCubit extends Cubit<bool> {
  AuthCheckCubit() : super(true);


  void isLoggedIn(){

    try {
      final bool isLoggedIn = PreferenceUtils.isLoggedIn();
      print("error $isLoggedIn");
    //  Future.delayed(const Duration(seconds: 1));
      emit(isLoggedIn);
    }catch(_){
      print("error $_");
    }
  }
}
