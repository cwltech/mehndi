class UpgradePackageModel {
  String? id;
  String? price;
  String? packageName;
  String? text1;
  String? text2;
  String? text3;

  UpgradePackageModel(
      {this.id,
      this.price,
      this.packageName,
      this.text1,
      this.text2,
      this.text3});

  UpgradePackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    packageName = json['package_name'];
    text1 = json['text_1'];
    text2 = json['text_2'];
    text3 = json['text_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['price'] = price;
    data['package_name'] = packageName;
    data['text_1'] = text1;
    data['text_2'] = text2;
    data['text_3'] = text3;
    return data;
  }
}
