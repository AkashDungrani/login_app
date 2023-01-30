// import 'dart:async';

// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   splashscreen() {
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacementNamed("register");
//     });
//   }

//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     splashscreen();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 300,
//             width: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               image: DecorationImage(
//                   image: AssetImage("assets/images/image2.png")),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Made In India",
//             style: TextStyle(
//                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
//           ),
//         ],
//       )),
//     );
//   }
// }
