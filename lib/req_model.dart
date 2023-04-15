class ReqModel {
  String userName;
  String address;
  String? reqPic;
  String createdAt;
  String userPhoneNumber;
  String userUid;
  String desc;
  String pin;
  String work;
  String userPic;

  ReqModel({
    required this.pin,
    required this.userPic,
    required this.desc,
    required this.userName,
    required this.address,
    required this.reqPic,
    required this.createdAt,
    required this.userPhoneNumber,
    required this.userUid,
    required this.work,

  });

  // from map
  factory ReqModel.fromMap(Map<String, dynamic> map) {
    print("as1df");
    return ReqModel(
      userPic: map['userPic'] ?? '',
      work: map['work'] ?? '',
      pin: map['pin'] ?? '',
      desc: map['desc'] ?? '',
      userName: map['userName'] ?? '',
      address: map['address'] ?? '',
      userUid: map['userUid'] ?? '',
      userPhoneNumber: map['userPhoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      reqPic: map['reqPic'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    print("a2sdf");
    return {

      "userName": userName,
      "userUid": userUid,
      "address": address,
      "reqPic": reqPic,
      "userPhoneNumber": userPhoneNumber,
      "createdAt": createdAt,
      "work": work,
      "desc":desc,
      "pin":pin,
      "userPic":userPic,
    };
  }
}
