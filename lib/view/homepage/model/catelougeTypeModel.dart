class CatelougeTypeModel {
  int? id;
  String? cataloguecategory;

  CatelougeTypeModel({this.id, this.cataloguecategory});

  CatelougeTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cataloguecategory = json['cataloguecategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cataloguecategory'] = this.cataloguecategory;
    return data;
  }
}
