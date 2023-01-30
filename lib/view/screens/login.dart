import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/globals.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final login = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
   bool checkBoxVal = false;

  String? name;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log In"),
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Form(
        //     key: login,
        //     child: Column(
        //       children: [
        //         TextFormField(
        //           validator: (val) {
        //             if (val!.isEmpty) {
        //               return 'Please enter username';
        //             }
        //           },
        //           onSaved: (value) {
        //             Globals.username = value;
        //           },
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             hintText: "Enter your Password",
        //             labelText: "Password",
        //           ),
        //         ),
        //         TextFormField(
        //           validator: (val) {
        //             if (val!.isEmpty) {
        //               return 'Please enter Password';
        //             }
        //           },
        //           onSaved: (value) {
        //             Globals.password = value;
        //           },
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             hintText: "Enter your username",
        //             labelText: "Username",
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20,
        //         ),
        //         ElevatedButton(
        //             onPressed: () async {
        //               // if (usernamecontroller.text == Globals.username &&
        //               //     passwordcontroller.text == Globals.password)
        //               // {
        //               setState(() {
        //                 Navigator.pushNamedAndRemoveUntil(
        //                     context, "/", (route) => false);
        //               });
        //               // }
        //             },
        //             child: Text("Log in"))
        //       ],
        //     ),
        //   ),
        // ),
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
                      image: AssetImage("assets/images/image3.png")),
                ),
              ),
              Form(
                key: login,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        validator: (val) {
                          if (val != name) {
                            return "Please Enter Valid name";
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
                          hintText: "Username",
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.18),
                        ),
                      ),
                      SizedBox(height: 10,),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        validator: (val) {
                          if (val != password) {
                            return "Please Enter Valid Password";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Globals.password = val;
                        },
                        controller: passwordcontroller,
                        obscureText: true,
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
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Remember me Login"),
                    Checkbox(
                        value: checkBoxVal,
                        onChanged: (val) {
                          setState(() {
                            checkBoxVal = val!;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () async {
                    

                      if (login.currentState!.validate()) {
                        login.currentState!.save();
                          SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        name = prefs.getString("name");
                        password = prefs.getString("password");
                       await  Navigator.of(context).pushReplacementNamed("/");

                        prefs.setBool("isLogin", true);
                        prefs.setBool("isRemember", checkBoxVal);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.pink,
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
        );
  }
}
