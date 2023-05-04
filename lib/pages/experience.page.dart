import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';
class Experience {
  String entreprise;
  String poste;
  String date;
  String description;
  String imagePath;

  Experience({
    required this.entreprise,
    required this.poste,
    required this.date,
    required this.description,
    required this.imagePath,
  });
}
final List<Experience> experiences = [

  Experience(
    entreprise: 'Primatec',
    poste: 'Développeur Mobile',
    date: 'janvier 2023 - Présent',
    description: 'Conception et développement d\'applications mobiles Android',
    imagePath: 'images/primatec.png',
  ),
  Experience(
    entreprise: 'Clinisys',
    poste: 'Développeur Full Stack',
    date: 'Janvier 2022 (1 ans)',
    description: 'Travail sur des projets web à grande échelle',
    imagePath: 'images/clinisys.png',
  ),
  Experience(
    entreprise: 'Telnet',
    poste: 'Big Data',
    date: 'Juin 2019 (2 ans)',
    description: 'Travail sur l\'integriter de hadoop',
    imagePath: 'images/telnet.jpg',
  ),
  Experience(
    entreprise: 'Vermeg',
    poste: 'Développeur Java',
    date: 'Juin 2018 (1 ans)',
    description: 'Conception et développement d\'applications mobiles et service',
    imagePath: 'images/vermeg.jpg',
  ),

Experience(
entreprise: 'Orange',
poste: 'Développeur Full Stack',
date: 'Janvier 2023 - Présent (1 ans)',
description: 'Travail sur des projets web à grande échelle',
imagePath: 'images/orange.jpg',
),

Experience(
entreprise: 'Acteol',
poste: 'Developeur Web',
date: 'Juin 2018 - Décembre 2019',
description: 'Conception et développement d\'applications web avec react',
imagePath: 'images/acteol.png',
),

];
class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),

      appBar: AppBar(
        title: Text('Expériences Professionnelles'),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context,"/home");// retour à la page précédente
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(experiences.length, (index) {
          return Container(
              color: Colors.grey[200],
            child:Card(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Image.asset(
                    experiences[index].imagePath,
                    height: 100.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(experiences[index].entreprise,style: TextStyle(fontSize: 10,color: Colors.red)),
                SizedBox(height: 2.0),
                Text(experiences[index].poste,style: TextStyle(fontSize:10,fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text(experiences[index].date,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text(experiences[index].description,style: TextStyle(fontSize: 10)),
              ],
            ),
          ),);
        }),
      ),
    );
  }
}
