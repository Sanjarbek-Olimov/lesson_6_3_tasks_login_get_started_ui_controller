import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_3_tasks/pages/task_1.dart';

import '../models/account_model.dart';
import '../shared_preference.dart';

class Task2Page extends StatefulWidget {
  static const String id ="task_2_page";
  const Task2Page({Key? key}) : super(key: key);

  @override
  _Task2PageState createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _createAccount(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    Account account = Account(fullname: name, email: email, phone: phone, password: password);
    Prefs.storeAccount(account);
    Navigator.pushReplacementNamed(context, Task1Page.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed(Task1Page.id);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pushReplacementNamed(Task1Page.id);
          return false;
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text("Let's Get Started!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Create an account of Q Allure to get all features",
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
                      controller: nameController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Fullname",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                          ),
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
                      controller: emailController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                          ),
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
                      controller: phoneController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: const Icon(
                            Icons.phone_android,
                          ),
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
                          prefixIcon: const Icon(
                            CupertinoIcons.lock
                          ),
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
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: const Icon(
                            CupertinoIcons.lock
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 15,
                  shape: const StadiumBorder(),
                  shadowColor: Colors.lightBlueAccent.shade100.withOpacity(0.5),
                  child: MaterialButton(
                    onPressed: (){
                      if(confirmPasswordController.text.isEmpty||passwordController.text.isEmpty||nameController.text.isEmpty||emailController.text.isEmpty||phoneController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fields are not fully filled")));
                        return;
                      }
                      if(confirmPasswordController.text!=passwordController.text){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
                      }
                      if(confirmPasswordController.text==passwordController.text){
                        _createAccount();
                      }
                    },
                    height: 55,
                    minWidth: 160,
                    shape: const StadiumBorder(),
                    color: Colors.blueAccent.shade400,
                    child: const Text(
                      "CREATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",style: TextStyle(fontSize: 15),),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, Task1Page.id);
                        },
                        child: const Text("Login here", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
