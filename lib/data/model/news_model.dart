class NewsModel {
  int? newsId;
  String? newsSmallbody;
  String? newsBody;
  String? newsImage;

  NewsModel({
    this.newsId,
    this.newsSmallbody,
    this.newsBody,
    this.newsImage,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    newsSmallbody = json['news_smallbody'];
    newsBody = json['news_body'];
    newsImage = json['news_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['news_id'] = newsId;
    data['news_smallbody'] = newsSmallbody;
    data['news_body'] = newsBody;
    data['news_image'] = newsImage;
    return data;
  }
}
