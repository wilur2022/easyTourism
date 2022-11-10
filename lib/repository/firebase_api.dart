import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easytourism/models/tourisy_sites.dart';
import 'package:easytourism/touristSites/virgen_lajas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easytourism/models/user.dart' as UserApp;


class FirebaseApi{
  TouristSites touristSite3 = TouristSites.Empty();
  VirgenLajas SVLL = VirgenLajas();
  Future<String?> registerUser(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    }on FirebaseAuthException catch (e){
      print("FirebaseAuthExceptionWilur ${e.code}");
      return e.code;
    }on FirebaseException catch (e){
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    }on FirebaseAuthException catch (e){
      print("FirebaseAuthExceptionWilur ${e.code}");
      return e.code;
    }on FirebaseException catch (e){
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }


  Future<String> createUser(UserApp.User user) async {
    try {
      final document = await FirebaseFirestore.instance.collection("Users").doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String> createTouristSites(TouristSites touristSites) async {
    try {
      final document = await FirebaseFirestore.instance.collection("TouristSites").doc(touristSites.idTs).set(touristSites.toJson());
      return touristSites.idTs;
    } on FirebaseException catch (e) {
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String> readTouristSiteBD(String idDoc) async{
        final db = await FirebaseFirestore.instance;
        final docRef =  await db.collection("TouristSites").doc((idDoc));
        docRef.get().then((DocumentSnapshot doc) async{
          final data = await doc.data() as Map<String,dynamic>;
          var touristSite3 = await TouristSites(data['idTs'], data['name'], data['photos'], data['location'], data['description']);

          });
        return "Exito";

  }
}