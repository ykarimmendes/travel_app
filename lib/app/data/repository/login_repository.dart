import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/login_api.dart';

class LoginRepository{
  final LoginApi _loginApi;
  LoginRepository(this._loginApi);

  Future<QuerySnapshot> getUser() async {
     return await _loginApi.getAll();
  }

}