import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_60/user_model.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

String url = "https://reqres.in/api/users";

// // http

// Future<UserModel>getData()async{
//   try {
//     http.Response response = await http.get(Uri.parse(url));
//
//     print(" response ${response.body}  status ${response.statusCode}");
//     return UserModel.fromJson(jsonDecode(response.body));
//   }catch(error){
//     print(error);
//     throw();
//   }}


  // DIO
  Dio dio =Dio();
 Future<UserModel> getData()async{
    try{
  Response response=await  dio.get(url);
  print("response : ${response.data}  status ${response.statusCode}");
  return UserModel.fromJson(response.data);
  }catch(error){
      print(error);
      throw();
    }
    }

@override
  void initState() {
  getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting :
              return const  CircularProgressIndicator();
                // IconButton(onPressed:(){print("error");},
                //   icon: const Icon(Icons.error));
            default:
              if(snapshot.hasError){
                return const Text("error is happened");
              }else{
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index)=> const SizedBox(height: 10,),
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index){
              final x = snapshot.data!.data![index];
              return ListTile(
                leading:
                CircleAvatar(
                  radius: 30,
                  child: Image.network("${x.avatar}")
                ) ,
                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage("")
                //     )
                //   ),
                // )
                title: Text("${x.firstName}"),
                subtitle: Text("${x.email}"),
                trailing: Text("${x.id}"),
              );
             }

        );}}}
      ),
      );

  }
}
