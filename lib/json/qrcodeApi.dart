
class IAQ {
  String status;
  String message;
  String selectedBy;
  String selectedTime;
  String hWMAC;
  String hWIP;
  String IAQSSID;
  String iAQALLLED;
  String dateTimeUpdate;
  String range;
  String iAQID;

  IAQ({
    this.status,
    this.message,
    this.selectedBy,
    this.selectedTime,
    this.hWMAC,
    this.hWIP,
    this.IAQSSID,
    this.iAQALLLED,
    this.dateTimeUpdate,
    this.range,
    this.iAQID
  });

  factory IAQ.fromJson(Map<String, dynamic> json) {
    return IAQ(
      status: json['status'],
      message: json['message'],
      hWMAC: json['HW_MAC'],
      hWIP: json['HW_IP'],
      IAQSSID : json['IAQ_SSID'],

    );
  }
}