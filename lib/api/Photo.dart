class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumnailUrl;
  Photo({this.albumId, this.id, this.title, this.url, this.thumnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      url: json['url'],
      thumnailUrl: json['thumbnailUrl'],
      title: json['title'],
    );
  }

}
