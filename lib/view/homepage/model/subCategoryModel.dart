class SubcategoryModel {
  int? id;
  String? subcat;
  String? image;
  int? categoryId;
  String? category;

  SubcategoryModel(
      {this.id, this.subcat, this.image, this.categoryId, this.category});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcat = json['subcat'];
    image = json['image'];
    categoryId = json['category_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcat'] = this.subcat;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    return data;
  }
}
