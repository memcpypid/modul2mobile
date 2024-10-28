import 'dart:convert';

// Fungsi untuk mem-parsing dari JSON
Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

// Fungsi untuk mengubah objek menjadi JSON
String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Status status;
  List<Article> articles;

  Articles({
    required this.status,
    required this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: Status.fromJson(json["status"]),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Status {
  String status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class Article {
  Source? source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] != null
            ? Source.fromJson(json["source"])
            : null, // Periksa null
        author: json["author"] as String?,
        title: json["title"] as String,
        description: json["description"] as String?,
        url: json["url"] as String,
        urlToImage: json["urlToImage"] as String?,
        publishedAt: DateTime.parse(json["publishedAt"] as String),
        content: json["content"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(), // Periksa null
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] as String?,
        name: json["name"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
