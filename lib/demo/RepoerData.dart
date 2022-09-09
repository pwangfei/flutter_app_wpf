
import 'PropertyData.dart';
import 'BuriedData.dart';

class RepoerData {
   String app_id;
   String timestamp;
   String source;
   String nonce_str;
   List<BuriedData> data;
   PropertyData property;
   String sign_type;
   String sign;

  RepoerData(this.app_id, this.timestamp, this.source, this.nonce_str, this.data,
      this.property, this.sign_type, this.sign);

  RepoerData.fromJson(Map<String, dynamic> json)
      : app_id = json['app_id'],
        timestamp = json['timestamp'],
        source = json['source'],
        nonce_str = json['nonce_str'],
        data = json['data'],
        property = json['property'],
        sign_type = json['sign_type'],
        sign = json['sign'];

  Map<String, dynamic> toJson() => {
        'app_id': app_id,
        'timestamp': timestamp,
        'source': source,
        'nonce_str': nonce_str,
        'data': data,
        'property': property,
        'sign_type': sign_type,
        'sign': sign,
      };

}