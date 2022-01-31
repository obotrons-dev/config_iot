class GetIP {
  String mac;
  String ip;
  String ssid;

  GetIP(this.mac, this.ip,this.ssid);

  GetIP.fromJson(Map<String, dynamic> json)
      : mac = json['mac'],
        ip = json['ip'],
        ssid = json['ssid'];

}