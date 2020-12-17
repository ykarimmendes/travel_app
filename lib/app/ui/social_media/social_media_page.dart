import 'package:flutter/material.dart';
import 'package:travelapp/app/data/model/social_media.dart';

class SocialMediaPage extends StatelessWidget {
  final List<SocialMedia> _medias;
  SocialMediaPage(this._medias);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var media in _medias) buildSocialItem(media),
      ],
    );
  }

  Padding buildSocialItem(SocialMedia sm) {
    if (sm.url == "")
      return new Padding(
        padding: const EdgeInsets.only(top: 0, left: 0),
      );

    EdgeInsets edge = const EdgeInsets.only(top: 10.0, left: 4.0);
    return Padding(
      padding: edge,
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/social_media/${sm.type}.png",
            width: 30,
            height: 30,
          ),
          Padding(
            padding: edge,
            child: Text(
              sm.url,
            ),
          )
        ],
      ),
    );
  }
}
