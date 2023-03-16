import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }

}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );

  }



MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert !"),
                content: Text("Do you want to delete"),
                actions: [
                  TextButton(onPressed:(){
                    MySnackBar("Delete Success",context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed:(){ Navigator.of(context).pop();}, child: Text("No")),
                ],
              )
          );
          
        }
    );
}




  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      appBar: AppBar(
        title: Text("partha"),
        actions: [
          IconButton(onPressed:() {MySnackBar("Account",context);}, icon: Icon(Icons.account_circle_sharp)),
          IconButton(onPressed:() {MySnackBar("Search",context);}, icon: Icon(Icons.search)),
          IconButton(onPressed:() {MySnackBar("Settings",context);}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: ElevatedButton(child: Text("click button"), onPressed: () {MyAlertDialog(context);}),
      )
    );
  }

}