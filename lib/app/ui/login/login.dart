import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';
import 'package:travelapp/app/ui/home/home_page.dart';

class Login extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController(LoginRepository(LoginApi())));
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 40,
                child: Image.asset("assets/logo.png"),
              ),
              Expanded(
                flex: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextFormField(
                        _userController, "Usuário", Icons.person_outline),
                    buildTextFormField(
                        _passwordController, "Senha", Icons.lock_open),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: RaisedButton(
                        onPressed: () async {
                          await c.get();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          "Logar",
                          style: TextStyle(fontSize: 18),
                        ),
                        textColor: Colors.black,
                      ),
                    ),
                    Text(
                      "Esqueceu a porra da senha?",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Expanded(
                flex: 30,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextFormField(
      TextEditingController controller, String hintText, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: _userController,
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
