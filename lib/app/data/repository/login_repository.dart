import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/provider/login_api.dart';

class LoginRepository{
  final LoginApi _loginApi;
  LoginRepository(this._loginApi);

  Future<List<User>>  getUser() async {
     return await _loginApi.getAll();
  }

  Future<List<String>> getFavouritesByUser(User user) async {
    return await _loginApi.getFavouritesByUser(user);
  }

}