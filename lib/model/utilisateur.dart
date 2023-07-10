


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';

class Utilisateur {
  late String uid;
  late String nom;
  late String prenom;
  late String email;
  String? telephone;
  String? avatar;
  List? favoris;
  String? pseudo;


  String get fullName {
    return prenom + " " + nom;
  }

  //constructeur
 Utilisateur.vide(){
    uid = "";
    nom ="";
    prenom = "";
    email = "";
 }

 Utilisateur(DocumentSnapshot snapshot){
    uid = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    email = map["EMAIL"];
    String? provisoireTel = map["TELEPHONE"];
    if(provisoireTel == null){
      telephone = "";
    }
    else
      {
        telephone = provisoireTel;
      }
    String? provisoireAvatar = map["AVATAR"];
    if(provisoireAvatar == null){
      avatar = defaultImage;
    }
    else
      {
        avatar = provisoireAvatar;
      }
    List? provisoirFavoris = map["FAVORIS"];
    if(provisoirFavoris == null){
      favoris = [];
    }
    else
      {
        favoris = provisoirFavoris;
      }
    String? provisoirePseudo = map["PSEUDO"];
    if(provisoirePseudo == null){
      pseudo = "";
    }
    else
      {
        pseudo = provisoirePseudo;
      }

 }




}