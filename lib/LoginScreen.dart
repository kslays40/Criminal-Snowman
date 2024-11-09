import 'package:acejoker/Judge%20Page.dart';
import 'package:acejoker/Police.dart';
import 'package:acejoker/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var username = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolicePage(),
                    ),
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Police",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JudgePage()),
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Judge",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Admin'),
                        content: Text('Login To Firebase Console For Features'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Admin",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscreen()),
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "User",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "CRIMINAL  RECORD MANAGEMENT SYSTEM ",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black),
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  "    User Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
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
                  "    Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          if (username == "kslays40" && password == "sarishman") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
                      icon: Icon(
                        CupertinoIcons.arrow_counterclockwise,
                        color: Colors.yellow,
                      )),
                ],
              ),
            );
          }
        },
        child: Icon(
          Icons.login_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
