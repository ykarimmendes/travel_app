class SocialMedia {
  String type;
  String url;

  List<SocialMedia> getAllSocialMedia(Map<String, dynamic> map) {
    List<SocialMedia> _medias = new List<SocialMedia>();
    SocialMedia s;
    map.forEach((key, value) {
      s = new SocialMedia();
      s.type = key;
      s.url = value;
      _medias.add(s);
    });
    return _medias;
  }
}
