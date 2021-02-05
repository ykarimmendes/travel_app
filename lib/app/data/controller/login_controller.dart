import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';

class LoginController extends GetxController {

  final LoginRepository _repository;
  LoginController(this._repository);

  final _login = User().obs;

  get login => this._login.value;
  set login(value) => this._login.value = value;

  get() {
    _repository.getUser().then((data) {
      Stream<QuerySnapshot> productRef = data;
      productRef.forEach((field){
        field.docs.asMap().forEach((index, data) {
          return _login.value = (User.fromSnapshot(data));
        });
      });
    });
  }
}