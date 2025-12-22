class TermsAndPolicyModel {
  String? shareLink;
  String? ratingLink;
  List<PageData>? pageData;

  TermsAndPolicyModel({this.shareLink, this.ratingLink, this.pageData});

  TermsAndPolicyModel.fromJson(Map<String, dynamic> json) {
    shareLink = json['share_link'];
    ratingLink = json['rating_link'];
    if (json['pageData'] != null) {
      pageData = <PageData>[];
      json['pageData'].forEach((v) {
        pageData!.add(new PageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['share_link'] = this.shareLink;
    data['rating_link'] = this.ratingLink;
    if (this.pageData != null) {
      data['pageData'] = this.pageData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageData {
  int? id;
  String? heading;
  String? description;

  PageData({this.id, this.heading, this.description});

  PageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['description'] = this.description;
    return data;
  }
}
