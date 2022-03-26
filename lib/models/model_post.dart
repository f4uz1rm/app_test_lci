class Posts {
  final String? id;
  final String? image;
  final int? likes;
  final List? tags;
  final String? text;
  final String? publishDate;
  final Map? owner;

  Posts(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  Posts.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        image = json['title'].toString(),
        likes = json['likes'] = 10,
        tags = json['tags'],
        text = json['text'],
        publishDate = json['publishDate'],
        owner = json['owner'];
}
