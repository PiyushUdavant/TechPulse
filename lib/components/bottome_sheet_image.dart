import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/text.dart';

class BottomeSheetImage extends StatelessWidget {
  final String imageUrl , title;
  const BottomeSheetImage({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:300,
      child: Stack(
        children:[
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors:[Colors.black,Colors.transparent],
                begin : Alignment.bottomCenter,
                end : Alignment.topCenter,
              )
            ),
            decoration:BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit:BoxFit.cover,
              )
            )
          ),
          Positioned(
            bottom:10,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              child: BoldText(text: title, color: Colors.white, size: 18)
            )
          )
        ]
      )
    );
  }
}