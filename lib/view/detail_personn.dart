import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/model/utilisateur.dart';
import 'package:ipssi_bd23_2/view/background_view.dart';
import 'package:ipssi_bd23_2/view/messagerie_view.dart';

class MyDetailPersonn extends StatefulWidget {
  Utilisateur user;
  MyDetailPersonn({Key? key, required this.user}) : super(key: key);

  @override
  State<MyDetailPersonn> createState() => _MyDetailPersonnState();
}

class _MyDetailPersonnState extends State<MyDetailPersonn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Stack(
      children: [
        const BackgroundView(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(tag: widget.user.uid,
                      child: Image.network(widget.user.avatar ?? defaultImage)
                  ),
                  Text(widget.user.fullName,style: TextStyle(fontSize: 25),),
                  Text(widget.user.email),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.messenger),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return MessagerieView(autrePersonne: widget.user);
                          }
                      ));

                      },
                      label: Text("Message"))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
