import "package:flutter/material.dart";

class ContactCreate extends StatefulWidget {
  @override
  _ContactCreateState createState() => _ContactCreateState();
}

class _ContactCreateState extends State<ContactCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
          backgroundColor: Colors.red),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save, size: 18.0),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Container(
                child: Icon(
                  Icons.verified_user,
                  size: 100.0,
                  color: Colors.white,
                ),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(125),
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
