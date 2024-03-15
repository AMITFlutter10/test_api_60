// class Data {
//   String? email;
//   String? first_name;
//   int? id ;
//   String? avatar;
// //constructor
//
//   Data({
//     this.email,
//     this.first_name,
//     this.id,
//     this.avatar,
//   });
//
//  // post
//  // dart => json
//   Map<String, dynamic> toMap() {
//     return {
//       'email': this.email,
//       'first_name': this.first_name,
//       'id': this.id,
//       'avatar': this.avatar,
//     };
//   }
// //  json => dart
//   // get
// // named constructor
//   factory  Data.fromMap(Map<String, dynamic> map) {
//     return Data(
//       email: map['email'] as String,
//       first_name: map['first_name'] as String,
//       id: map['id'] as int,
//       avatar: map['avatar'] as String,
//     );
//   }
// }


class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  UserModel(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support});

  UserModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }

}