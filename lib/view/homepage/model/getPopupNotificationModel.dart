class GetPopUpNotificationModel {
  String? id;
  String? text;
  dynamic categoryId;
  String? image;
  String? status;

  GetPopUpNotificationModel(
      {this.id, this.text, this.categoryId, this.image, this.status});

  GetPopUpNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    categoryId = json['category_id'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['text'] = text;
    data['url'] = categoryId;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
