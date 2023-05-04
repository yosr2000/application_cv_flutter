import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';
class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white,
                  Colors.blueGrey])
            ),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile1.jpg"),

              ),
            ),
          ),
          ...(GlobalParams.menus as List).map((item){
            return ListTile(
              title: Text('${item['title']}',style: TextStyle(fontSize: 22),),
              leading: item['icon'],
              trailing: Icon(Icons.arrow_right,color: Colors.grey,),
              onTap: ()async{
                if('${item['title']}'!="Déconnexion"){
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "${item['route']}");

                }else{
                  prefs=await SharedPreferences.getInstance();
                  prefs.setBool("connecte", false);
                  Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic>route) => false);
                }
              },

            );
          })

          // ListTile(
          //   title: Text('Acceuil',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.home,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/home");
          //   },
          // ),
          // ListTile(
          //   title: Text('Méteo',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.sunny_snowing,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/meteo");
          //   },
          // ),
          // ListTile(
          //   title: Text('Gallerie',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.photo,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/gallerie");
          //   },          ),
          // ListTile(
          //   title: Text('Pays',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.location_city,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/pays");
          //   },
          // ),
          // ListTile(
          //   title: Text('Contact',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.contact_page,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/contact");
          //   },          ),
          // Divider(height: 4,color: Colors.blue,),
          // ListTile(
          //   title: Text('Parametres',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.settings,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: (){
          //     Navigator.of(context).pop();
          //     Navigator.pushNamed(context, "/parametres");
          //   },          ),
          // ListTile(
          //   title: Text('Deconnexion',style: TextStyle(fontSize: 22),),
          //   leading: Icon(Icons.logout,color: Colors.blue,),
          //   trailing: Icon(Icons.arrow_right,color: Colors.blue,),
          //   onTap: ()async{
          //     prefs=await SharedPreferences.getInstance();
          //     prefs.setBool("connecte", false);
          //     Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic>route) => false);
          //   },
          // ),
        ],
      ),
    );
  }
}
