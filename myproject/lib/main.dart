import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main(List<String> args) {
  runApp(myapp());
}
class myapp extends StatefulWidget {
  const myapp({ Key? key }) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
final _form = GlobalKey<FormState>();
      late String Name;
      late String email;
      late String mobile;
      late String city;
  void savedata() async{
    _form.currentState?.save();
    var url = "https://mydbflutter-default-rtdb.firebaseio.com/"+"Data.json";
    try {
    final jsonapi = http.post(Uri.parse(url),
    body: jsonEncode({
       'Name':Name,
       'Email': email,
       "Mob Number":mobile,
       "city":city
    }
    )
    );
    } catch (error) {
      throw error;
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.white24,
      body: Form(
      key: _form,
      child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white10,),
      margin: EdgeInsets.all(30),
      child: 
      SingleChildScrollView(
        child: Column(
      children: [
         SizedBox(height: 24,),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(23),
          decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(13),color: Colors.lightGreen),
          child: Text('Fire Base',style: TextStyle(fontSize: 30,color: Colors.white),),
        ),
        SizedBox(height: 47,),
        Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow,),
          child: TextFormField( decoration: InputDecoration(
            hintText: 'Your Name'),
            onSaved: (value){
              Name = value!;
            }, ) ,),
             SizedBox(height: 14,),
        Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow,),
          child: TextFormField( decoration: InputDecoration(
            hintText: 'Email ID'),
            onSaved: (value1){
               email = value1!;
            }, ) ,),
               SizedBox(height: 14,),
        Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow,),
          child: TextFormField( decoration: InputDecoration(
            hintText: 'Mob Number'),
            onSaved: (value2){
               mobile = value2!;
            }, ) ,),   SizedBox(height: 14,),
        Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow,),
          child: TextFormField( decoration: InputDecoration(
            hintText: ' City'),
            onSaved: (value3){
               city = value3!;
            }, ) ,),
            SizedBox(height: 24),
            ElevatedButton(onPressed: savedata, child: Icon(Icons.add))
       
         
      
        ],
      )),
      ),
     ) ));
  }

}