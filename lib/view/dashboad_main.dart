import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipssi_bd23_2/controller/all_favoris.dart';
import 'package:ipssi_bd23_2/controller/all_personn.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/controller/firestoreHelper.dart';
import 'package:ipssi_bd23_2/view/background_view.dart';
import 'package:ipssi_bd23_2/view/map_view.dart';

class DashBoard extends StatefulWidget {
  String? mail;
  String? password;
  DashBoard({Key? key,this.mail,this.password}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //variables
  int indexMenu = 0;
  String? urlImage;
  String? nameImage;
  Uint8List? bytesImage;
  bool isUpdatePseudo = false;
  TextEditingController pseudo = TextEditingController();
  
  
  //fonctions
  popImage(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("L'image"),
            content: Image.memory(bytesImage!),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Annulation")),
              TextButton(onPressed: (){
                FirestoreHelper().stockageImage("images", nameImage!, moi.uid, bytesImage!).then((value){
                  setState(() {
                    urlImage = value;
                    moi.avatar = value;
                  });
                  Map<String,dynamic> map = {
                    "AVATAR": urlImage
                  };
                  FirestoreHelper().updateUser(moi.uid, map);
                  Navigator.pop(context);
                });
              }, child: Text("Upload")),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.purple,
        child: SafeArea(
          child: Column(
            children:  [
              //avatar circulaire
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async{
                      FilePickerResult? resultat = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        withData: true
                      );
                      if(resultat != null){
                        nameImage = resultat.files.first.name;
                        bytesImage = resultat.files.first.bytes;
                        popImage();
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 42,
                      child : CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(moi.avatar ?? defaultImage),
                      ),
                    ),
                  ),

                  Column(
                    children:  [
                      Text(moi.fullName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                      const SizedBox(height: 5,),

                      (isUpdatePseudo)?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                              child: TextField(
                                controller: pseudo,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Entrer votre pseudo",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  )
                                ),
                              )
                          ),

                          TextButton(onPressed: (){
                            setState(() {
                              moi.pseudo = pseudo.text;
                              Map<String,dynamic> map = {
                                "PSEUDO": moi.pseudo
                              };
                              FirestoreHelper().updateUser(moi.uid, map);
                              isUpdatePseudo = false;
                            });

                          },
                              child: const Text("OK")
                          ),
                        ],
                      ):Row(
                        children: [
                          Text(moi.pseudo!,style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                          IconButton(
                              onPressed: (){
                                print("modification pseudo");
                                setState(() {
                                  isUpdatePseudo = true;
                                });

                              },
                              icon: const FaIcon(FontAwesomeIcons.pencil,color: Colors.white,size: 15,)
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 2,color: Colors.black,),
              const SizedBox(height: 10,),



             ListTile(
               leading: Icon(Icons.mail,color: Colors.white,),
               title: Text(moi.email,style: TextStyle(color: Colors.white,fontSize: 15),),
             ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,

        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: const FaIcon(FontAwesomeIcons.bars)
            );
          }

        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber,
     
      body: Stack(
        children: [
          const BackgroundView(),
          SafeArea(
              child: bodyPage()
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexMenu,
        onTap: (value){
          setState(() {
            indexMenu = value;
          });

        },



        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Personnes"),

          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Cartes"),
        ]
      ),

    );
  }

  Widget bodyPage(){
    switch(indexMenu){
      case 0 : return const AllPerson();
      case 1 : return const AllFavoris();
      case 2: return const MyMapView();
      default: return Text("Erreur");
    }
  }
}
