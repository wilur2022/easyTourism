import 'package:easytourism/touristSites/virgen_lajas.dart';
import 'package:easytourism/touristSites/virgen_playa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_pages.dart';

class MenuTouristSites extends StatelessWidget {


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
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Santuario Virgen de las Lajas", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VirgenLajas()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Santuario Virgen de la Playa", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VirgenPlaya()));

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
