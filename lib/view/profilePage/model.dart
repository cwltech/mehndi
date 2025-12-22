class ProfileModel {
  String? id;
  String? fname;
  Null? lname;
  String? email;
  String? mobile;
  String? gender;
  String? image;

  ProfileModel(
      {this.id,
      this.fname,
      this.lname,
      this.email,
      this.mobile,
      this.gender,
      this.image});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['image'] = image;
    return data;
  }
}

class EnquiryModel {
  String? date;
  List<Catalogue>? catalogue;

  EnquiryModel({this.date, this.catalogue});

  EnquiryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['catalogue'] != null) {
      catalogue = <Catalogue>[];
      json['catalogue'].forEach((v) {
        catalogue!.add(new Catalogue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.catalogue != null) {
      data['catalogue'] = this.catalogue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catalogue {
  int? id;
  String? heading;
  String? image;
  String? categoryId;
  String? subCategoryId;
  String? catalogueId;

  Catalogue(
      {this.id,
      this.heading,
      this.image,
      this.categoryId,
      this.subCategoryId,
      this.catalogueId});

  Catalogue.fromJson(Map<String, dynamic> json) {
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
