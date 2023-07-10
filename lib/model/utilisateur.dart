
class Utilisateur {
  late String uid;
  late String nom;
  late String prenom;
  late String email;
  String? telephone;
  String? avatar;
  List? favoris;


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




}