class CatelougeListByCategoryModel {
  int? id;
  String? heading;
  String? type;
  String? primium;
  String? catalogueCateName;
  String? des;
  dynamic image;
  String? bookingType;
  String? videoUrl;
  String? skuId;
  int? wishlist;

  CatelougeListByCategoryModel(
      {this.id,
      this.heading,
      this.type,
      this.primium,
      this.catalogueCateName,
      this.image,
      this.des,
      this.bookingType,
      this.videoUrl,
      this.skuId,
      this.wishlist});

  CatelougeListByCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    type = json['type'];
    primium = json['image_premium'];
    catalogueCateName = json['catalogue_cate_name'];
    image = json['image'];
    des = json['description'];
    bookingType = json["bookingtype"];
    videoUrl = json["video_url"];
    skuId = json["sku_id"];
    wishlist = json["wishlist"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['heading'] = heading;
    data['type'] = type;
    data['image_premium'] = primium;
    data['catalogue_cate_name'] = catalogueCateName;
    data['image'] = image;
    data['description'] = des;
    data["bookingtype"] = bookingType;
    data["video_url"] = videoUrl;
    data["sku_id"] = skuId;
    data["wishlist"] = wishlist;
    return data;
  }
}
