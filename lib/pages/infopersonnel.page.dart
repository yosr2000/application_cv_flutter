import 'package:examan_final/menu/drawer.widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Information Personnel'),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "/home"); // retour à la page précédente
          },
        ),
      ),
      body: ListView(
        children: [
          Image.asset("images/cont.png"),

          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nom et prenom'),
            subtitle: Text('yosr frikha'),
          ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('yosrfrikha12@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Téléphone'),
            subtitle: Text('(+216) 54 446 675'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Adresse'),
            subtitle: Text('route Ain km 5'),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('Permis'),
            subtitle: Text('permis de conduite class B'),
          ),
        ],
      ),
    );
  }
}
