class PayModel {
  String txnId;
  String resCode;
  String txnRef;
  String status;
  String approvalRef;


  PayModel({
    required this.txnId,
    required this.resCode,
    required this.txnRef,
    required this.status,
    required this.approvalRef,

  });

  // from map
  factory PayModel.fromMap(Map<String, dynamic> map) {
    print("as1df");
    return PayModel(
      txnId: map['txnId'] ?? '',
      resCode: map['resCode'] ?? '',
      txnRef: map['txnRef'] ?? '',
      status: map['status'] ?? '',
      approvalRef: map['approvalRef'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    print("a2sdf");
    return {

      "txnId": txnId,
      "resCode": resCode,
      "txnRef": txnRef,
      "status": status,
      "approvalRef": approvalRef,

    };
  }
}
