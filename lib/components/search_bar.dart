import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});
  static TextEditingController searchController = TextEditingController(
    text: ''
  );

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:AppColors.darkgrey,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller : SearchBar.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search a Keyword or a Phrase',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none,
                    )
                  )
                )
              ]
            )
          )
        ),
        InkWell(
          onTap:() {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            height: 45,
            width : 45,
            decoration : BoxDecoration(
              color : AppColors.darkgrey,
              shape : BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          )
        )
      ]
    );
  }
}