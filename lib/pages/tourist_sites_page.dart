import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easytourism/pages/menu_tourist_sites_page.dart';
import 'package:easytourism/pages/new_tourist_sites_page.dart';
import 'package:flutter/material.dart';


class TouristSitesPage extends StatefulWidget {
  const TouristSitesPage({Key? key}) : super(key: key);
  final String title = "SITIOS TURISTICOS";
  @override
  State<TouristSitesPage> createState() => _TouristSitesPageState();
}

class _TouristSitesPageState extends State<TouristSitesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        drawer: MenuTouristSites(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("TouristSites").snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData) return const Text('Loading');
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index){
                    QueryDocumentSnapshot site = snapshot.data!.docs[index];
                    return Card(
                      child: ListTile(
                        title: Text(site['name']),
                      ),
                    );
                  },
                );
            },
          ),
        ),

        //Button de Registrar nuevo sitio turistico
        floatingActionButton: FloatingActionButton(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewTouristSites()));
          },
          tooltip: 'Nuevo Sitio',
          child: const Text("New"),

        )





    );
  }
}
