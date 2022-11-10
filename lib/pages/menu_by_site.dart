import 'package:easytourism/pages/tourist_sites_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_pages.dart';

class MenuSite extends StatelessWidget {
  const MenuSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent
            ),
            child: Image(image: AssetImage('assets/images/turismo.png')),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.backspace, size: 20, color: Colors.lightBlue,),
                title: const Text("Regresar", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TouristSitesPage()));
                },

              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.lightBlue,),
                title: const Text("Salir", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
