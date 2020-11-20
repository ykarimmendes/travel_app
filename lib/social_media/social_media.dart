import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EdgeInsets edge =  const EdgeInsets.only(top: 10.0, left: 8.0);

    return Column(
      children: <Widget>[
        Padding(
          padding: edge,
          child: Row(
            children: <Widget>[
              Image.asset("assets/social_media/facebook.png", width: 30,height: 30,),
              Padding(
                padding: edge,
                child: Text("www.facebook.com.br/Hangoo",),
              )
            ],
          ),
        ),

        Padding(
          padding: edge,
          child: Row(
            children: <Widget>[
              Image.asset("assets/social_media/instagrampng.png", width: 30,height: 30,),
              Padding(
                padding: edge,
                child: Text("www.facebook.com.br/Hangoo"),
              )
            ],
          ),
        ),
        Padding(
          padding: edge,
          child: Row(
            children: <Widget>[
              Image.asset("assets/social_media/tiktok.png", width: 30,height: 30,),
              Padding(
                padding: edge,
                child: Text("www.facebook.com.br/Hangoo"),
              )
            ],
          ),
        ),
        Padding(
          padding: edge,
          child: Row(
            children: <Widget>[
              Image.asset("assets/social_media/zap.png", width: 30,height: 30,),
              Padding(
                padding: edge,
                child: Text("www.facebook.com.br/Hangoo"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
