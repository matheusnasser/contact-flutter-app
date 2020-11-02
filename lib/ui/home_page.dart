import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/ui/contact_create_page.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();

    // c.name = "Matheus Nasser2";
    // c.email = "asdasdasd@gmail.com";
    // c.phone = "551231515";
    // c.img = "imgtest";

    // helper.saveContact(c);

    helper.getAllContacts().then((value) {
      setState(() {
        contacts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contatos"),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print("clicked");
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 18.0),
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactCreate()));
          },
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Text(
                contacts[index].name,
                style: TextStyle(color: Colors.black),
              );
            }));
  }
}
