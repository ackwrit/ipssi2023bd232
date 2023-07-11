import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/constante.dart';
import 'package:ipssi_bd23_2/controller/firestoreHelper.dart';
import 'package:ipssi_bd23_2/controller/my_animation.dart';
import 'package:ipssi_bd23_2/controller/permission_photo.dart';
import 'package:ipssi_bd23_2/view/background_view.dart';
import 'package:ipssi_bd23_2/view/dashboad_main.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionPhoto().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
//variables
TextEditingController mail = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController nom = TextEditingController();
TextEditingController prenom = TextEditingController();
bool isConnected = true;









//fonctions

  Chargement(){


    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){

          if(defaultTargetPlatform == TargetPlatform.iOS){
            return  CupertinoAlertDialog(
              content: Container(
                child: Lottie.asset("assets/connection-data.json")
              ),

            );
          }
          else
            {
              return AlertDialog(
                content: Container(
                    child: Lottie.asset("assets/connection-data.json")
                ),
              );
            }
        }
    );
    Timer(const Duration( seconds: 10), () {
      Navigator.pop(context);
    });
  }

  SnackBar SnackShow(){
    return SnackBar(
      duration: const Duration(minutes: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),


        backgroundColor: Colors.purple,
        content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextField(
                controller: prenom,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "Entrer votre prénom",
                    prefixIconColor: Colors.purple,
                    prefixIcon: const Icon(Icons.person,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: nom,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "Entrer votre nom",
                    prefixIconColor: Colors.purple,
                    prefixIcon: const Icon(Icons.person,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: mail,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "Entrer votre mail",
                    prefixIconColor: Colors.purple,
                    prefixIcon: const Icon(Icons.mail,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "Entrer votre password",
                    prefixIconColor: Colors.purple,
                    prefixIcon: const Icon(Icons.lock,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.amber
                ),
                  onPressed: (){
                  FirestoreHelper().register(nom.text, prenom.text, mail.text, password.text).then((value){
                    ScaffoldMessenger.of(context).clearSnackBars();

                    setState(() {
                      moi = value;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                  }).catchError((onError){
                    popUpErreur();
                  });





                  },
                  child: const Text("S'inscrire",style: TextStyle(color: Colors.white),)
              )
            ],
          ),

        )
    );
  }
  void popUpErreur(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Erreur de saisie"),
            content: Lottie.asset("assets/fail.json"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("ok")
              )
            ],
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          const BackgroundView(),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //image
                    MyAnimation(
                        time: 1,
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.L39zRncyWUqe2lqci3uGCwHaEK&pid=Api"),
                                  fit: BoxFit.fill
                              )
                          ),

                        )
                    ),

                    const SizedBox(height: 5,),
                    //texte descriptif
                    MyAnimation(
                      time: 2,
                      child: const Text("Ma première application",
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                    ),

                    const SizedBox(height: 10,),
                    //mail
                    MyAnimation(
                      time: 3,
                      child: TextField(
                        controller: mail,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            hintText: "Entrer votre mail",
                            prefixIconColor: Colors.purple,
                            prefixIcon: const Icon(Icons.mail,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    //password
                    MyAnimation(
                      time: 4,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Entrer votre password",
                            prefixIconColor: Colors.purple,
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),


                    const SizedBox(height: 10,),


                    //bouton

                    MyAnimation(
                      time: 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              elevation: 10,
                              shape: const StadiumBorder()
                          ),
                          onPressed: (){
                         FirestoreHelper().connect(mail.text, password.text).then((value){

                           setState(() {
                             moi = value;
                           });
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));

                         }).catchError((onError){
                           popUpErreur();
                         });


                          },
                          child: const Text("Connexion")
                      ),
                    ),



                    MyAnimation(
                      time: 6,
                      child: TextButton(
                          onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackShow());

                          },
                          child: const Text("Inscription")
                      ),
                    )
                  ],
                ),
              ),
            ),

          ),
        ],
      ),




    );
  }
}
