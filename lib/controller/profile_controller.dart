import 'package:flutter/cupertino.dart';
import 'package:vikn_codes/service/share_pref_service.dart';

class ProfileController extends ChangeNotifier {
  bool isLoading = true;

  String? userName;
  String? userEmail;

  getProfileDetails() async {
    // final userId = SharedPrefService.getUserID();
    // final url = 'https://www.viknbooks.com/api/v10/users/user-view/$userId/';
    // final response = await _httpService.get(url);
    // if(response.statusCode==200){
    //   print(response.body);
    // }
    userName = await SharedPrefService.getUserName();
    userEmail = await SharedPrefService.getUserEmail();
    isLoading = false;
    notifyListeners();
  }
}
