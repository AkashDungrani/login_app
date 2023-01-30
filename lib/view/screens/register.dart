import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/globals.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> akash = GlobalKey();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String? username;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registeration"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/image1.png",
                      ),
                      fit: BoxFit.fill),
                ),
              ),

              Form(
                key: akash,
                child:
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child:
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "User Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Globals.name = val;
                      },
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green.shade800,
                          ),
                        ),
                        hintText: "User Name",
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.18),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Globals.email = val;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green.shade800,
                          ),
                        ),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.18),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Globals.password = val;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green.shade800,
                          ),
                        ),
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.18),
                      ),
                    ),
                  ],
                ),
                // ),
              ),
              SizedBox(
                height: 40,
              ),
              // Text(
              //   "Tap to Register your account",
              //   style: TextStyle(color: Colors.pinkAccent),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (akash.currentState!.validate()) {
                        akash.currentState!.save();
                        Navigator.of(context).pushNamed('login');
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("isregistered", true);
                        prefs.setString("name", Globals.name.toString());
                        prefs.setString(
                            "password", Globals.password.toString());
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.green,
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
