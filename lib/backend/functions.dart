// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_news_app/utils/key.dart';
import 'package:tech_news_app/components/search_bar.dart';

Future<List> fetchnews() async{
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' + 
      Key.key +
      '&q=' +
      SearchBar.searchController.text,
    ),
  );
  Map result = jsonDecode(response.body);
  
  if(result.isNotEmpty){
    print("Fetched");
  }
  return result['articles'];
}