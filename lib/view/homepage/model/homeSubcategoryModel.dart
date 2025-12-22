class HomeSubcategoryModel {
  int? id;
  String? subcat;
  String? image;
  int? categoryId;
  String? category;

  HomeSubcategoryModel(
      {this.id, this.subcat, this.image, this.categoryId, this.category});

  HomeSubcategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcat = json['subcat'];
    image = json['image'];
    categoryId = json['category_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['subcat'] = subcat;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['category'] = category;
    return data;
  }
}
