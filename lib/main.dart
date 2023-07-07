import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/my_animation.dart';
import 'package:ipssi_bd23_2/view/dashboad_main.dart';

void main() {
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//variables
TextEditingController mail = TextEditingController();
TextEditingController password = TextEditingController();
bool isConnected = true;


//fonctions
  void popUpErreur(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Erreur"),
            content: Text("Erreur dans votre saisie"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("ok")
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

        title: Text(widget.title),
      ),
      body:SafeArea(
        child:  Padding(
          padding:  const EdgeInsets.all(10),
          child: Center(
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
                      hintText: "Entrer votre mail",
                      prefixIcon: const Icon(Icons.mail),
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
                        hintText: "Entrer votre password",
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
                      if(isConnected){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return  DashBoard(password: password.text,);
                            }
                        ));
                      }
                      else
                        {
                          //afficher un pop d'erreur
                          popUpErreur();
                        }


                      },
                      child: const Text("Connexion")
                  ),
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}
