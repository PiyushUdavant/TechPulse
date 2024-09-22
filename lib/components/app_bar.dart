import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  // const CustomAppBar({Key ? key}) :
  // preferredSize = const Size.fromHeight(50), super(key:key);
  const CustomAppBar({super.key}) :
  preferredSize = const Size.fromHeight(50);
  
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children:[
                BoldText(
                  text : 'Tech' ,
                  size : 24 ,
                  color: AppColors.primary,
                  ),
                ModifiedText(
                  text : 'Pulse',
                  color: AppColors.white,
                  size:  24 ,
                )
              ]
            ),
            Transform.scale(
              scale:1.9,
              child:Image.asset(
                'assets/TechPulseLogo.png'
              ),
            ),
          ],
        ),
      ),
    );

  // Code Given By Akshit Madan =>

    // return AppBar(
    //   actions:[],
    //   backgroundColor: AppColors.bgColor,
    //   elevation:0,
    //   title:Container(
    //     height: 40,
    //     child:Row(
    //       mainAxisAlignment : MainAxisAlignment.center,
    //       children:[
    //         BoldText(
    //           text : 'Tech',
    //           size : 20 ,
    //           color : AppColors.primary,
    //         ),
    //         ModifiedText(
    //           text : 'Newz' ,
    //           size : 20 ,
    //           color : AppColors.white,
    //         )
    //       ]
    //     )
    //   ),
    //   centerTitle : true ,
    // );

  }
}