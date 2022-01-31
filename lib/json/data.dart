class DataSetting {
  String nameDevice;
  Config config;
  Wifi_config wifi;

  DataSetting({this.nameDevice, this.config, this.wifi});

  DataSetting.fromJson(Map<String, dynamic> json) {
    nameDevice = json['name_device'];
    config =
    json['config'] != null ? new Config.fromJson(json['config']) : null;
    wifi = json['wifi'] != null ? new Wifi_config.fromJson(json['wifi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_device'] = this.nameDevice;
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.wifi != null) {
      data['wifi'] = this.wifi.toJson();
    }
    return data;
  }
}

class Config {
  String type;
  String storage;
  String path;
  String httpheader;
  String ota;
  String otacode;
  String millisecond;
  String host;
  String port;
  String subscribe;
  String username;
  String password;

  Config({this.type, this.storage, this.path, this.httpheader, this.ota,this.otacode,this.millisecond,this.host,this.port,this.subscribe,this.password,this.username});

  Config.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    storage = json['storage'];
    path = json['path'];
    httpheader = json['httpheader'];
    ota = json['ota'];
    otacode = json['otacode'];
    millisecond = json['millisecond'];
    host = json['host'];
    port = json['port'];
    subscribe = json['subscribe'];
    username = json['username'];
    password = json['password'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
      data['type'] = this.type;
      data['storage'] = this.storage;
      data['path'] = this.path;
      data['httpheader'] = this.httpheader;
      data['ota'] = this.ota;
      data['otacode'] = this.otacode;
      data['millisecond'] = this.millisecond;
      data['host'] = this.host;
      data['port'] = this.port;
      data['subscribe'] = this.subscribe;
      data['username'] = this.username;
      data['password'] = this.password;
      return data;
  }
}

class Wifi_config {
  String ssid;
  String wifiPassword;

  Wifi_config({this.ssid, this.wifiPassword});

  Wifi_config.fromJson(Map<String, dynamic> json) {
    ssid = json['ssid'];
    wifiPassword = json['wifi_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ssid'] = this.ssid;
    data['wifi_password'] = this.wifiPassword;
    return data;
  }
}
