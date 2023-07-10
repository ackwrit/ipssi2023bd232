import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/view/background_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width *0.75,
        color: Colors.purple,
        child: SafeArea(
          child: Column(
            children:  [
              //avatar circulaire
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      FilePicker.platform.pickFiles(
                        type: FileType.image
                      );
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
                      Row(
                        children: [
                          Text(moi.pseudo!,style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                          IconButton(
                              onPressed: (){
                                print("modification pseudo");

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
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favoris")
        ]
      ),

    );
  }

  Widget bodyPage(){
    switch(indexMenu){
      case 0 : return Text("Liste de personnes");
      case 1 : return Text("Favoris");
      default: return Text("Erreur");
    }
  }
}
