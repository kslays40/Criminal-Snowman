import 'package:acejoker/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var username = "";
  var idval = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF94cedb),
        title: Text("CRIMINAL  RECORD MANAGEMENT SYSTEM ",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/bg.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF94cedb),
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 1.9,
            child: ListView(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Sign In / Log In",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  "      User Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type in your username",
                    ),
                  ),
                ),
                Text(
                  "      Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type in your password",
                    ),
                  ),
                ),
                Text(
                  "      ID Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    onChanged: (value) {
                      idval = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "ID Number",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (username == "kslays40" &&
              password == "sarishman" &&
              idval == "snowman") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Code 404'),
                content: Text('Wrong Data Entered'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.arrow_counterclockwise)),
                ],
              ),
            );
          }
        },
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
