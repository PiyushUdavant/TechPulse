// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/components/bottome_sheet_image.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void openBottomSheet(
  BuildContext context , String title , description , imageUrl , url
){
  showBottomSheet(
    backgroundColor: Colors.black,
    shape : RoundedRectangleBorder(
      borderRadius : BorderRadius.only(
        topLeft: Radius.circular(20) , 
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,
    context: context ,
    builder :(context) {
      return MyBottomSheetLayout(
        title: title ,
        description: description,
        url: url,
        imageUrl : imageUrl,
      );
    },
  );
}

// The following code required to modify because in new version of url_launcher canLaunch and launch functions are depreciated. Hence , we use Uri.parse() to convert the url of type string to Uri object and then passed it as a parameter.

// _launchUrl(String url) async {
//   if(await canLaunch(url)){
//     await launch(url);                    //Code Given in Tutorial
//   }else{
//     throw 'Could not launch $url';
//   }
// }

Future <void> _launchUrl(String urlString) async{
  final Uri url = Uri.parse(urlString);
  print('Attempting to launch URL : $url');
  if(await canLaunchUrl(url)){
    await launchUrl(url , mode: LaunchMode.externalApplication);
  }else{
    throw "Could not launch $url";
  }
}

// Your Bottom Sheet Widget Class where you create Bottom Sheet according to 
// your own Preferences.
class MyBottomSheetLayout extends StatelessWidget {
  final String title , description , url , imageUrl ;
  const MyBottomSheetLayout({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.title,
    required this.url,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:<Widget>[
          BottomeSheetImage(
            imageUrl: imageUrl, 
            title: title
          ),
          Container(
            padding:EdgeInsets.all(10),
            child:ModifiedText(
              text: description, 
              color: Colors.white, 
              size: 16
            )
          ),
          InkWell(
            onTap:() => _launchUrl(url),
            child: Container(
              padding:EdgeInsets.all(12),
              decoration:BoxDecoration(
                color: Colors.white12,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RichText(
                text: TextSpan(  
                  //Instead of adding children you can directly use this as your main TextSpan and define the text , recognizer and style . I added because I thought it's giving me some error . But nope , it does not give a single error.
                  children:<TextSpan>[
                    TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()..onTap = () {
                        _launchUrl(url);
                      },
                      style: GoogleFonts.lato(
                        color: Colors.blue.shade400,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ), 
                    )
                  ]
                )
              )
            ),
          )
        ]
      )
    );
  }
}

// Here , I made the Container on line No. 93 as InkWell so that we can click on it directly instead of clicking on the only Text. I done it because while using the apk , I was not able to click on the text properly and it was taking 2-3 taps. Hence I thought to make it inkwell and use onTap property. Since _launchUrl is a Future function hence we can't directly mention it , we need to return that function inside the onTap property as I have done and not like , onTap : _launchUrl(url). 
// Also, now even if you don't mention the RichText and just mention the normal text with the custom styling of GoogleFonts , it's fine.