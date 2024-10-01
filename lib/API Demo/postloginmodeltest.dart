// class loginpost {
//   String? name;
//   String? clientid;
//   Null? phonenumber;
//   String? email;
//   String? address;
//   String? sId;
//   int? iV;
//
//   loginpost(
//       {this.name,
//         this.clientid,
//         this.phonenumber,
//         this.email,
//         this.address,
//         this.sId,
//         this.iV});
//
//   loginpost.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     clientid = json['clientid'];
//     phonenumber = json['phonenumber'];
//     email = json['email'];
//     address = json['address'];
//     sId = json['_id'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['clientid'] = this.clientid;
//     data['phonenumber'] = this.phonenumber;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['_id'] = this.sId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }



class loginpostt {
  String? name;
  Null? phonenumber;
  String? email;
  String? password;
  String? confirmpassword;
  String? sId;
  int? iV;

  loginpostt(
      {this.name,
        this.phonenumber,
        this.email,
        this.password,
        this.confirmpassword,
        this.sId,
        this.iV});

  loginpostt.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonenumber = json['phonenumber'];
    email = json['email'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmpassword'] = this.confirmpassword;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
