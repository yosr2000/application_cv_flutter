

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../menu/drawer.widget.dart';
class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:MyDrawer(),
    appBar: AppBar(title: Text('Profil'),
    backgroundColor: Color(0xFF1BBDB8),
      //Changer la couleur ici
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context,"/home");// retour à la page précédente
        },
      ),
    ),
        body:
        SingleChildScrollView(
          child: Column(
            children:[
              Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    child: Ink.image(
                      height: 220,
                      width: 405,
                      image: AssetImage('images/back.jpg'),
                      fit: BoxFit.cover,


                    ),

                  ),
                  Positioned(
                    top: 150,
                    left: 120,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("images/profile1.jpg"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Text(
                "yosr frikha",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Développeur Web ",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Profil:                                          ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    ' Je suis convaincu que mes compétences en développement, mon esprit d\'équipe et ma passion pour la technologie me permettront de contribuer de manière significative à des projets ambitieux et stimulants dans le domaine du développement.',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.25,
                    ),
                  ),
                ),
              ),


            ],

          ),
        ),



    );






  }


}
