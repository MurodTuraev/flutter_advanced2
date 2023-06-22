
class Post {
  // int? id;
  String? first_name;
  String? last_name;
  String? content;
  String? date;
  String? img_url;

  Post(this.first_name, this.last_name, this.content, this.date, this.img_url);

  Post.fromJson(Map<dynamic, dynamic> json)
        :first_name = json['first_name'],
        last_name = json['last_name'],
        content = json['content'],
        date = json['date'],
        img_url = json['img_url'];

  Map<String, dynamic> toJson() => {
    'first_name': first_name,
    'last_name': last_name,
    'content': content,
    'date': date,
    'img_url': img_url
  };
}