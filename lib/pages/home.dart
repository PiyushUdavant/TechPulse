// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/components/news_box.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/components/app_bar.dart';
import 'package:tech_news_app/components/search_bar.dart' as s;
import 'package:tech_news_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const CustomAppBar(),
      body: Column(
        children:[
          Divider(color:Colors.white24,),
          s.SearchBar(),
          Expanded(
            child: SizedBox(
              width : w ,
              child: FutureBuilder<List>(
                future : fetchnews(),
                builder:(context, snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          description: snapshot.data![index]['description']
                            .toString(), 
                          imageUrl: (
                            snapshot.data![index]['urlToImage'] != null
                          ) ? snapshot.data![index]['urlToImage']
                            : Constants.imageUrl, 
                          time: snapshot.data![index]['publishedAt'], 
                          title: snapshot.data![index]['title'], 
                          url: snapshot.data![index]['url']
                        ); 
                      },
                    );
                  }
                  else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }

                  //By default , it shows a loading screen ...
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  );
                },
              )
            )
          )
        ]
      )
    );
  }
}