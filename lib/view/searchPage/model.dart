class SearchModel {
  int? id;
  String? heading;
  String? image;

  SearchModel({this.id, this.heading, this.image});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['image'] = this.image;
    return data;
  }
}
