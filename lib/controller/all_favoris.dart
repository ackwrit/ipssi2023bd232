import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/controller/firestoreHelper.dart';
import 'package:ipssi_bd23_2/model/utilisateur.dart';
import 'package:ipssi_bd23_2/view/detail_personn.dart';

class AllFavoris extends StatefulWidget {
  const AllFavoris({Key? key}) : super(key: key);

  @override
  State<AllFavoris> createState() => _AllFavorisState();
}

class _AllFavorisState extends State<AllFavoris> {
  List mesFavoris = [];

  @override
  void initState() {
    // TODO: implement initState
    for( int i = 0;  i< moi.favoris!.length ;i++ ){
      FirestoreHelper().getUser(moi.favoris![i]).then((value){
        setState(() {
          mesFavoris.add(value);
        });

      });

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(mesFavoris== []){
      return Text("Aucun favrois");
    }
    else
      {
    return GridView.builder(
      itemCount: mesFavoris.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context,index){
        Utilisateur lesAutres = mesFavoris[index];
         return Container(
           height: MediaQuery.of(context).size.height * 0.6,
           child: Column(
             children: [
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context){
                         return MyDetailPersonn(user: lesAutres);
                       }
                   ));
                 },
                 child: Hero(
                   tag: lesAutres.uid,
                   child: CircleAvatar(
                     radius: 70,
                     backgroundImage: NetworkImage(lesAutres.avatar ?? defaultImage),
                   ),
                 ),
               ),
               const SizedBox(height: 10,),
               Text(lesAutres.fullName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
             ],
           )
         );

      },
    );
        }

  }
}
