class StatusAPi {
  String msg;
  int status;
  // List<dynamic> data;

  StatusAPi(this.msg, this.status);

  StatusAPi.fromJson(Map<String, dynamic> json)
      : msg = json['msg'],
        status = json['status'];
        // data = json['data'].map((value) => UserApi.fromJson(value)).toList();

}


// class UserApi {
//   String firstname;
//   String lastname;
//   String email;
//   String nameshare;
//   String nameshareEN;
//   String shareunit;
//   String sharenumber;
//   String sum;
//   String percents;
//
//   UserApi(this.firstname, this.lastname, this.email,this.shareunit,this.sharenumber,this.sum,this.percents);
//
//   UserApi.fromJson(Map<String, dynamic> json)
//       : firstname = json['fname'],
//         lastname = json['lname'],
//         email = json['email'],
//         nameshare = json['nameshare'],
//         nameshareEN = json['nameshareEN'],
//         shareunit = json['shareunit'],
//         sharenumber = json['sharenumber'],
//         sum = json['sum'],
//         percents = json['percents'];
// }
