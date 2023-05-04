import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

void main() {
  runApp(ObjectifPage());
}

class ObjectifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:MyDrawer(),

      appBar: AppBar(

          title: Text('Objectifs professionnels '),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context,"/home");// retour à la page précédente
          },
        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset("images/medaille.png"),
              SizedBox(height: 8,),
              Text(
                'Mes objectifs professionnels dans le domaine de développement :',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '* Devenir un développeur Flutter certifié',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '* Maîtriser les dernières technologies et les meilleures pratiques de développement',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '* Participer à des projets ambitieux et innovants qui mettent en valeur mes compétences en développement avec Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),

    );
  }
}
