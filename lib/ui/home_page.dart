import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/ui/contact_create_page.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import "package:flutter/material.dart";
import 'dart:io';

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
    // c.img = null;

    // helper.saveContact(c);

    helper.getAllContacts().then((value) {
      print(value);
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
                  print(contacts);
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 18.0),
          backgroundColor: Colors.red,
          onPressed: () {
            _showContactPage();
          },
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return _contactCard(context, index);
            }));
  }

  Widget _contactCard(BuildContext context, int index) {
    return (GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: contacts[index].img != null
                          ? FileImage(File(contacts[index].img))
                          : AssetImage("images/person.png"))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contacts[index].name ?? "",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(contacts[index].email ?? "",
                    style: TextStyle(fontSize: 18.0)),
                Text(
                  contacts[index].phone ?? "",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          ]),
        ),
      ),
      onTap: () {
        _showContactPage(contact: contacts[index]);
      },
    ));
  }

  void _showContactPage({Contact contact}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
  }
}
