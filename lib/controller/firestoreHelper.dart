//elle va effectué toutes les opérations concernant la base de donnée
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper {
  //attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");



  //méthode
  //inscription
  register(String nom, String prenom , String email , String password) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = resultat.user!.uid;
    Map<String,dynamic> map = {
      "NOM":nom,
      "PRENOM": prenom,
      "EMAIL":email,
    };
    addUser(uid, map);
  }

  //connexion
  connect(String email, String password){
    auth.signInWithEmailAndPassword(email: email, password: password);
  }



  //ajouter un utilisateur
addUser(String uid , Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
}


  //mise à jour des infos de l'utilisateur


}