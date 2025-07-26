import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vikn_codes/model/login_model.dart';
import 'package:vikn_codes/service/api_service.dart';
import 'package:vikn_codes/service/share_pref_service.dart';

class LoginController extends ChangeNotifier{
  final _httpService = HttpService();
  bool isLoading = false;

   LoginModel? loginModel;

  Future<bool> login({required String userName, required String password})async{
    isLoading = true;
    notifyListeners();
    final url = 'https://api.accounts.vikncodes.com/api/v1/users/login';
    final body = {
      "username": userName,
      "password": password,
      "is_mobile": true
    };
    print(body);

    final response =await  _httpService.post(url, body);
     if(response.statusCode==200){
       final loginModel = loginModelFromJson(response.body);
       if(loginModel.data!=null){
         SharedPrefService.saveTokens(
             accessToken: loginModel.data?.access??'',
             userId: loginModel.data?.userId??0,
           userName: loginModel.data?.username??'',
           useremail: loginModel.data?.email??''
         );
         isLoading = false;
         notifyListeners();
         return true;
       }
     }

       isLoading = false;
       notifyListeners();
       return false;

  }
}