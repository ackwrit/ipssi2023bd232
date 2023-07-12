import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/controller/firestoreHelper.dart';
import 'package:ipssi_bd23_2/model/utilisateur.dart';

class AllPerson extends StatefulWidget {
  const AllPerson({Key? key}) : super(key: key);

  @override
  State<AllPerson> createState() => _AllPersonState();
}

class _AllPersonState extends State<AllPerson> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreHelper().cloudUsers.snapshots(),
        builder: (context,snap){
         List? documents = snap.data?.docs;
         if(documents == []){
           return const Text("Aucune Donnée");
         }
         else
           {
             return ListView.builder(
               itemCount: documents!.length,
                 itemBuilder: (context,index){
                 Utilisateur lesAutres = Utilisateur(documents[index]);
                 return Dismissible(
                   key: Key(lesAutres.uid),
                   child: Card(
                     elevation: 10,
                     color: Colors.white,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                     child: ListTile(
                       leading: CircleAvatar(
                         radius: 60,
                         backgroundImage: NetworkImage(lesAutres.avatar ?? defaultImage),
                       ),
                       title: Text(lesAutres.fullName),
                       subtitle: Text(lesAutres.email,textAlign: TextAlign.start,),
                       trailing: (moi.favoris!.contains(lesAutres.uid))?IconButton(
                         onPressed: (){
                           setState(() {
                             moi.favoris!.remove(lesAutres.uid);
                           });
                           Map<String,dynamic> map = {
                             "FAVORIS":moi.favoris
                           };
                           FirestoreHelper().updateUser(moi.uid, map);
                         },
                         icon : const Icon(Icons.favorite),color: Colors.red,):IconButton(
                         onPressed: (){
                           setState(() {
                             moi.favoris!.add(lesAutres.uid);
                           });
                           Map<String,dynamic> map = {
                             "FAVORIS":moi.favoris
                           };
                           FirestoreHelper().updateUser(moi.uid, map);

                         },
                         icon: const Icon(Icons.favorite),

                       ),
                     ),
                   ),
                 );

                 }
             );

           }

        }
    );
  }
}
