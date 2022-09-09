

class BuriedData {

  var event;
  var mcc;
  var mnc;
  var timestamp;

  BuriedData(this.event, this.mcc, this.mnc, this.timestamp);

  BuriedData.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        mcc = json['mcc'],
        mnc = json['mnc'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
        'event': event,
        'mcc': mcc,
        'mnc': mnc,
        'timestamp': timestamp,
      };
}