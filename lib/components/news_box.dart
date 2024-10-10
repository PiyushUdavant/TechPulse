import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/components/bottom_sheet.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class NewsBox extends StatelessWidget {
  final String url , imageUrl , title , time , description;
  const NewsBox({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children:[
        InkWell(
          onTap : () => openBottomSheet(
            context, title , description , imageUrl , url ,
          ) ,
          child: Container(
            padding : const EdgeInsets.all(20),
            margin : const EdgeInsets.only(left : 5 , right :5 , top : 5),
            width : w,
            color: AppColors.black,
            child: Row(
              children:[
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height : 60 , 
                      width : 60,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider,
                        ),
                        borderRadius : BorderRadius.circular(10),
                      )
                    );
                  },
                  placeholder: (context, url) => CircularProgressIndicator(
                    color:AppColors.primary,
                  ),
                  errorWidget:(context, url, error) => const Icon(Icons.error),
                ),
                
                const SizedBox(width:8),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      BoldText(
                        text: title, 
                        color: AppColors.white, 
                        size: 16,
                      ),
                      const SizedBox(
                        height : 5 ,
                      ),
                      ModifiedText(
                        text : time,
                        color : AppColors.lightwhite,
                        size : 12,
                      )
                    ]
                  ),
                )
              ]
            )
          )
        ),
        const Divider(),
      ]
    );
  }
}