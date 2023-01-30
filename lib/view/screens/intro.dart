import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/models/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  checkprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("issplsshvisited", true);
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkprefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Expanded(
              //   flex: 1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: introduction
                  //         .map(
                  //           (e) => Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Container(
                  //               height: 10,
                  //               width: 10,
                  //               decoration: BoxDecoration(
                  //                   color: Colors.black,
                  //                   borderRadius: BorderRadius.circular(10)),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //   ),
                  //   TextButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, 'home');
                  //     },
                  //     child: const Text(
                  //       "SKIP",
                  //       style: TextStyle(color: Colors.grey, fontSize: 12),
                  //     ),
                  //   ),
                  // ],
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children:[ 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: introduction
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        height: 660,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                                    "${introduction[Globals.index]['image']}"))),
                        child: Text("${introduction[Globals.index]['name']}"),
                      ),
                    //   Text(
                    //   "${introduction[Globals.index]['name']}",
                    //   style: const TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 26,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "${intro[index]['text1']}",
                  //   style: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 60,
                  ),
                  // Image(
                  //   alignment: Alignment.center,
                  //   fit: BoxFit.fill,
                  //   height: 300,
                  //   width: 300,
                  //   image: NetworkImage("${introduction[Globals.index]['image']}"),
                  // ),
                ],
              ),
             
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: ElevatedButton(
              //       onPressed: () {
                      // setState(() {
                      //   if (Globals.index < 2) {
                      //     Globals.index++;
                      //   } else {
                      //     Navigator.pushNamed(context, '/');
                      //   }
                      //   if (Globals.index > 2) {
                      //     Globals.index == 2;
                      //   }
                      // });
                    // },
              //       style: ButtonStyle(
              //         shape: MaterialStateProperty.all(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //         ),
              //         backgroundColor:
              //             MaterialStateProperty.all(Colors.black),
              //       ),
              //       child: const Text(
              //         "Next",
              //         style: TextStyle(color: Colors.white, fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
                        if (Globals.index < 2) {
                          Globals.index++;
                        } else {
                          Navigator.pushNamed(context, 'splash');
                        }
                        if (Globals.index > 2) {
                          Globals.index == 2;
                        }
                      });
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
