import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapi/service/apiService.dart';

import 'article.dart';

void main() {
  runApp( MyApp());
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App'),),
      body: FutureBuilder(
        future: ApiService().getArticle(),
          builder : (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                      elevation: 5,
                      child: Column(
                        children: [

                          Image.network(

                            '${snapshot.data![index].urlToImage}',
                          ),

                          Text('${snapshot.data![index].title}',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            height: 4,
                          ),

                          Text('${snapshot.data![index].description}',
                            maxLines: 2,overflow: TextOverflow.ellipsis),


                            ],



                          ),






                  );
                });

            }

          return Center(child: CircularProgressIndicator());
          },


      ),


    );
  }
}