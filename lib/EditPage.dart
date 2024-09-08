import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController crimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: MediaQuery.of(context).size.height / 2.45,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type Criminal Name",
                    ),
                    controller: nameController,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type Criminal Gender",
                    ),
                    controller: genderController,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type Criminal Age",
                    ),
                    controller: ageController,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintText: "Type Criminal Crime",
                    ),
                    controller: crimeController,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('Criminals')
              .add({
            'Name': nameController.text,
            'Gender': genderController.text,
            'Age': ageController.text,
            'Crime': crimeController.text,
          });
          Navigator.pop(context);
        },
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
