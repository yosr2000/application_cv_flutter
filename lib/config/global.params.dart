import 'package:flutter/material.dart';
class GlobalParams{
  static List<Map<String, dynamic>>menus=[
    {"title":"Accueil","icon":Icon(Icons.home,color:Colors.red,),"route":"/home"},
    {"title":"Profil","icon":Icon(Icons.person,color:Colors.red,),"route":"/profil"},
    {"title":"information","icon":Icon(Icons.info,color:Colors.blue,),"route":"/info"},
    {"title":"Expérience","icon":Icon(Icons.location_city,color:Colors.red,),"route":"/experience"},
    {"title":"Education","icon":Icon(Icons.book,color:Colors.red,),"route":"/education"},
    {"title":"Objectif","icon":Icon(Icons.data_object_rounded,color:Colors.red,),"route":"/objectif"},
    {"title":"Competence","icon":Icon(Icons.emoji_objects,color:Colors.amber,),"route":"/competence"},
    {"title":"Position","icon":Icon(Icons.location_on,color:Colors.red,),"route":"/position"},

    {"title":"Déconnexion","icon":Icon(Icons.logout,color:Colors.red,),"route":"/authentification"}
  ];





}