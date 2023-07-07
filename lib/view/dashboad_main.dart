import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width *0.45,
        color: Colors.purple,
        child: SafeArea(
          child: Column(
            children: [
              //avatar circulaire
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.L39zRncyWUqe2lqci3uGCwHaEK&pid=Api"),
              ),

              //nom prénom
              Text("Djino Dissingar"),

              //pseudo
              Text("Skweel"),

              //adresse mail
              Text("dissingardjino@icloud.com")
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.password ??"J'ai pas tapé le password",),
      ),
     
      body: SafeArea(child: bodyPage()),
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
