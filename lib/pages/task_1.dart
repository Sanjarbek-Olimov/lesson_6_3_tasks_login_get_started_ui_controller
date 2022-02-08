import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_3_tasks/models/account_model.dart';
import 'package:lesson_6_3_tasks/pages/home_page.dart';
import 'package:lesson_6_3_tasks/pages/task_2.dart';

import '../models/user_model.dart';
import '../shared_preference.dart';

class Task1Page extends StatefulWidget {
  static const String id = "task_1_page";

  const Task1Page({Key? key}) : super(key: key);

  @override
  _Task1PageState createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Account account = Account(
    email: "",
    password: "",
    phone: '',
    fullname: '',
  );

  void _doLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User(email: email, password: password);
    Prefs.storeUser(user);
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  void _loadAccount() async {
    account = (await Prefs.loadAccount())!;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadAccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                alignment: Alignment.bottomCenter,
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/image.jpg"),
                        fit: BoxFit.cover)),
                child: const Text(
                  "Welcome back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Log in to your existent account of Q Allure",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(50),
                  shadowColor: Colors.lightBlueAccent.shade100.withOpacity(0.1),
                  child: TextField(
                    controller:
                        account.email == "" ? emailController : emailController
                          ..text = account.email,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: const Icon(CupertinoIcons.person),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(50),
                  shadowColor: Colors.lightBlueAccent.shade100.withOpacity(0.1),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: const Icon(CupertinoIcons.lock),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text("Forgot Password?"),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 15,
                shape: const StadiumBorder(),
                shadowColor: Colors.lightBlueAccent.shade100.withOpacity(0.5),
                child: MaterialButton(
                  onPressed:(){
                    if(passwordController.text.isEmpty||emailController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fields are not fully filled")));
                    }
                    else if(account.password==passwordController.text && account.email==emailController.text){
                      _doLogin();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your password or email is incorrect")));
                    }
                  },
                  height: 50,
                  minWidth: 150,
                  shape: const StadiumBorder(),
                  color: Colors.blueAccent.shade400,
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Or connect using",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _doLogin();
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: const Color.fromRGBO(59, 89, 152, 1),
                    minWidth: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/facebook.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Facebook",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.red.shade600,
                    minWidth: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Google",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Task2Page.id);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
