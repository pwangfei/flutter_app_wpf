
class PropertyData {

   int os;
   var device_id;
   var guid;
   var user_id;
   var ip;
   var device_model;
   var brand;
   var carrier;
   var sys_lang;
   var network_type;
   var app_lang;
   var sys_version;
   var app_version;
   var screen_width;
   var screen_height;
   var memory;
   var storage;
   var channel;
   var package_name;


  PropertyData(this.os, this.device_id, this.guid, this.user_id, this.ip,
      this.device_model, this.brand, this.carrier, this.sys_lang, this.network_type, this.app_lang, this.sys_version, this.app_version, this.screen_width,
      this.screen_height, this.memory, this.storage, this.channel, this.package_name);

  PropertyData.fromJson(Map<String, dynamic> json)
      : os = json['os'],
        device_id = json['device_id'],
        guid = json['guid'],
        user_id = json['user_id'],
        ip = json['ip'],
        device_model = json['device_model'],
        brand = json['brand'],
        carrier = json['carrier'],
        sys_lang = json['sys_lang'],
        network_type = json['network_type'],
        app_lang = json['app_lang'],
        sys_version = json['sys_version'],
        app_version = json['app_version'],
        screen_width = json['screen_width'],
        screen_height = json['screen_height'],
        memory = json['memory'],
        storage = json['storage'],
        channel = json['channel'],
        package_name = json['package_name'];

  Map<String, dynamic> toJson() => {
        'os': os,
        'device_id': device_id,
        'guid': guid,
        'user_id': user_id,
        'ip': ip,
        'device_model': device_model,
        'brand': brand,
        'carrier': carrier,
        'sys_lang': sys_lang,
        'network_type': network_type,
        'app_lang': app_lang,
        'sys_version': sys_version,
        'app_version': app_version,
        'screen_width': screen_width,
        'screen_height': screen_height,
        'memory': memory,
        'storage': storage,
        'channel': channel,
        'package_name': package_name,
      };

}