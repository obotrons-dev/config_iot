class Formdata {
  String iaqCO2;
  String iaqTVOC;
  String iaqPM1;
  String iaqPM25;
  String iaqPM10;
  String iaqTEMP;
  String iaqRH;
  String iaqMAC;
  String iaqLocalIP;
  String iaqSSID;
  String iaqDatetime;

  Formdata({this.iaqCO2,
    this.iaqTVOC,
    this.iaqPM1,
    this.iaqPM25,
    this.iaqPM10,
    this.iaqTEMP,
    this.iaqRH,
    this.iaqMAC,
    this.iaqLocalIP,
    this.iaqSSID,
    this.iaqDatetime});

  factory Formdata.fromJson(Map<String, dynamic> json) {
    return Formdata(
      iaqCO2: json['iaq_CO2'],
      iaqTVOC: json['iaq_TVOC'],
      iaqPM1: json['iaq_PM1'],
      iaqPM25: json['iaq_PM25'],
      iaqPM10: json['iaq_PM10'],
      iaqTEMP: json['iaq_TEMP'],
      iaqRH: json['iaq_RH'],
      iaqMAC: json['iaq_MAC'],
      iaqLocalIP: json['iaq_Local_IP'],
      iaqSSID: json['iaq_SSID'],
      iaqDatetime: json['iaq_datetime'],

    );
  }
}