class WhislistModel {
  int? id;
  String? heading;
  String? image;
  String? categoryId;
  String? subCategoryId;
  String? catalogueId;

  WhislistModel(
      {this.id,
      this.heading,
      this.image,
      this.categoryId,
      this.subCategoryId,
      this.catalogueId});

  WhislistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    image = json['image'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    catalogueId = json['catalogue_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['catalogue_id'] = this.catalogueId;
    return data;
  }
}
