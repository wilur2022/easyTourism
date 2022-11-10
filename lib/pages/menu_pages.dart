import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_pages.dart';

class MenuPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Image(image: AssetImage('assets/images/turismo.png')),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.lightBlue,),
                title: Text((FirebaseAuth.instance.currentUser?.email).toString(), style: const TextStyle(fontSize: 20),),
                textColor: Colors.green,

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
