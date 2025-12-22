class CategoryListModel {
  int? id;
  String? category;
  String? image;
  List<SubCatList>? subCatList;

  CategoryListModel({this.id, this.category, this.image, this.subCatList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] ?? "";
    image = json['image'] ?? "";
    if (json['subCatList'] != null) {
      subCatList = <SubCatList>[];
      json['subCatList'].forEach((v) {
        subCatList!.add(SubCatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category'] = category;
    data['image'] = image;
    if (subCatList != null) {
      data['subCatList'] = subCatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCatList {
  int? id;
  String? subcat;
  String? image;

  SubCatList({this.id, this.subcat, this.image});

  SubCatList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcat = json['subcat'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['subcat'] = subcat;
    data['image'] = image;
    return data;
  }
}
