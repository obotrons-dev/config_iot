class JsonCalibrate {
  String name;
  Calibrate calibrate;

  JsonCalibrate({this.name, this.calibrate});

  JsonCalibrate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calibrate = json['calibrate'] != null
        ? new Calibrate.fromJson(json['calibrate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.calibrate != null) {
      data['calibrate'] = this.calibrate.toJson();
    }
    return data;
  }
}

class Calibrate {
  Pm1 pm1;
  Pm1 pm25;
  Pm1 pm10;
  Pm1 co2;
  Pm1 tvoc;
  Pm1 temp;
  Pm1 humid;

  Calibrate(
      {this.pm1,
        this.pm25,
        this.pm10,
        this.co2,
        this.tvoc,
        this.temp,
        this.humid});

  Calibrate.fromJson(Map<String, dynamic> json) {
    pm1 = json['pm1'] != null ? new Pm1.fromJson(json['pm1']) : null;
    pm25 = json['pm2.5'] != null ? new Pm1.fromJson(json['pm2.5']) : null;
    pm10 = json['pm10'] != null ? new Pm1.fromJson(json['pm10']) : null;
    co2 = json['co2'] != null ? new Pm1.fromJson(json['co2']) : null;
    tvoc = json['tvoc'] != null ? new Pm1.fromJson(json['tvoc']) : null;
    temp = json['temp'] != null ? new Pm1.fromJson(json['temp']) : null;
    humid = json['humid'] != null ? new Pm1.fromJson(json['humid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pm1 != null) {
      data['pm1'] = this.pm1.toJson();
    }
    if (this.pm25 != null) {
      data['pm2.5'] = this.pm25.toJson();
    }
    if (this.pm10 != null) {
      data['pm10'] = this.pm10.toJson();
    }
    if (this.co2 != null) {
      data['co2'] = this.co2.toJson();
    }
    if (this.tvoc != null) {
      data['tvoc'] = this.tvoc.toJson();
    }
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    if (this.humid != null) {
      data['humid'] = this.humid.toJson();
    }
    return data;
  }
}

class Pm1 {
  String offset;
  String scale;

  Pm1({this.offset, this.scale});

  Pm1.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    scale = json['scale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['scale'] = this.scale;
    return data;
  }
}