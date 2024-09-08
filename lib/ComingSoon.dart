import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comingsoon extends StatefulWidget {
  const Comingsoon({super.key});

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Loading.gif'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(child: Text("Coming Soon",style: TextStyle(fontSize: 25),)),
      )
    );
  }
}
