import 'package:flutter/material.dart';
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
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
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.L39zRncyWUqe2lqci3uGCwHaEK&pid=Api"),
                      fit: BoxFit.fill
                    )
                  ),

                ),
                const SizedBox(height: 5,),
                //texte descriptif
                const Text("Ma première application",
                  style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),

                const SizedBox(height: 10,),
                //mail
                TextField(
                  decoration: InputDecoration(
                    hintText: "Entrer votre mail",
                    prefixIcon: const Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),

                const SizedBox(height: 10,),

                //password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Entrer votre password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),


                const SizedBox(height: 10,),


                //bouton

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    elevation: 10,
                    shape: const StadiumBorder()
                  ),
                    onPressed: (){
                      print("connexion");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const DashBoard();
                          }
                      ));
                    },
                    child: const Text("Connexion")
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}
