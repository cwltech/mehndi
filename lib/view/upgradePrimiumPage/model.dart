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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['package_name'] = this.packageName;
    data['text_1'] = this.text1;
    data['text_2'] = this.text2;
    data['text_3'] = this.text3;
    return data;
  }
}
