import 'package:acejoker/ComingSoon.dart';
import 'package:acejoker/EditPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF94cedb),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 70,
                height: MediaQuery.of(context).size.height - 20,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.space_dashboard_rounded,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Comingsoon()),
                        );
                      },
                      icon: Icon(Icons.settings_applications_outlined),
                      selectedIcon: Icon(Icons.settings),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Comingsoon()),
                        );
                      },
                      icon: Icon(CupertinoIcons.bell),
                      selectedIcon: Icon(CupertinoIcons.bell_fill),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Comingsoon()),
                          );
                        },
                        icon: Icon(CupertinoIcons.doc_on_doc_fill)),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.logout_rounded)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: (MediaQuery.of(context).size.width - 120),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Criminal Records Dash Board",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF94cedb),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 300,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 10,
                            ),
                            Text(
                              "     Performance Report",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("     Caught : 13"),
                            Text("     Dead : 13"),
                            Text("     Men : 0"),
                            Text("     Women : 13"),
                            Text("     Juvenile : 0"),
                            Text("     Indian : 13"),
                            Text("     Non Indian : 13"),
                            Text("     Officers : 30"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF94cedb),
                        ),
                        height: 300,
                        width: (MediaQuery.of(context).size.width - 120 - 310),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Date: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  StreamBuilder(
                                    stream: Stream.periodic(
                                        const Duration(seconds: 1)),
                                    builder: (context, snapshot) {
                                      return Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  StreamBuilder(
                                    stream: Stream.periodic(
                                        const Duration(seconds: 1)),
                                    builder: (context, snapshot) {
                                      return Text(
                                        DateFormat('hh:mm:ss')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Text("User Name: kslays40"),
                              Text("Password: sari*****"),
                              Text("Id Number: ****man"),
                              Text("Department: ATS Chief"),
                              Text("Division: JHK Special JAP"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Records",
                        style: TextStyle(fontSize: 22),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddUserScreen()),
                            );
                          },
                          icon: Icon(Icons.upload_rounded)),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF94cedb),
                    ),
                    height: 300,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Criminals')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var documents = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            var doc = documents[index];
                            return ListTile(
                              title: Text(doc['Name'] +
                                  " - " +
                                  doc['Gender'] +
                                  " - " +
                                  doc['Crime'] +
                                  " - " +
                                  doc["Age"]),
                              //subtitle: Text(doc['Gender']),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
