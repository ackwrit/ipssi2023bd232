import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //variables
  int indexMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     
      body: SafeArea(child: bodyPage()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexMenu,
        onTap: (value){
          setState(() {
            indexMenu = value;
          });

        },
        items: [
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
