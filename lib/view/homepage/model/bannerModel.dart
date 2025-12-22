class BannerModel {
  String? image;
  String? link;

  BannerModel({this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['link'] = link;
    return data;
  }
}
