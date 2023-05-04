

import 'package:examan_final/pages/authentification.page.dart';
import 'package:examan_final/pages/competence.page.dart';
import 'package:examan_final/pages/education.page.dart';
import 'package:examan_final/pages/experience.page.dart';
import 'package:examan_final/pages/home.page.dart';
import 'package:examan_final/pages/infopersonnel.page.dart';
import 'package:examan_final/pages/location.dart';
import 'package:examan_final/pages/objectif.page.dart';
import 'package:examan_final/pages/profil.page.dart';

import 'package:examan_final/pages/inscription.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  final routes={
    '/home':(context)=>HomePage(),
    '/inscription':(context)=>InscriptionPage(),
    '/authentification':(context)=>LoginScreen(),
    '/profil':(context)=>ProfilPage(),
    '/education':(context)=>EducationPage(),
    '/competence':(context)=>CompetencePage(),
    '/experience':(context)=>ExperiencePage(),
    '/position':(context)=>LocationPage(),
    '/objectif':(context)=>ObjectifPage(),
    '/info':(context)=>InfoPage(),



  };
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var x = prefs.data;
          if (prefs.hasData) {
            bool conn = x?.getBool('connecte') ?? false;
            if (conn)
// return MaterialApp(home: HomePage());
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
                routes: routes,
              );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            routes: routes,);


        } );}

}
