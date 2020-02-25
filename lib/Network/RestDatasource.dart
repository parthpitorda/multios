import 'package:connectivity/connectivity.dart';
import 'package:multios/Vo/PropertyData.dart';

import 'ApiStateListener.dart';
import 'NetworkUtil.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  ApiStateListener _apiStateListener;

  RestDatasource(this._apiStateListener);


  static final BASE_URL = "https://staging-api-demo-dot-high-apricot-196023.appspot.com/api/v1/property/search/";

  searchProperty(String pageNumber, String suggestion) {

    _checkInternetConnectivity().then((onValue) { //check network after call api :)
      Map<String, String> requestHeaders = {
        'Content-type': 'application/x-www-form-urlencoded',
      };
      _netUtil.post(BASE_URL, body: {
        "filter_by_day": "4",
        "local_event_start_date": "2019-11-15",
        "local_event_end_date": "2019-11-15",
        "event_start_date": "2019-11-15",
        "event_end_date": "2019-11-15",
        "gmap_bounds": "{}",
        "geo_bounding_box": "{}",
        "is_map_list": "false",
        "request_type": "WEB",
        "page_no": pageNumber,
        "list_type": "0",
//        "open_house_type[0]": "0",
//        "city": "0",
        "abrrevation": "AZ",
        "state": "56",
//        "geo_id": "0",
//        "zipcode": "0",
//        "zipcode_code": "0",
        "suggestion": suggestion

      },headers: requestHeaders).then((dynamic res) {
        print(res.toString());

        _apiStateListener.onSuccess(PropertyData.fromJson(res));
//        return new PropertyData.fromJson(res);
      }).catchError((Exception error)=>_apiStateListener.onError(error));
    });
  }


  Future<bool> _checkInternetConnectivity() async{
    var result = await Connectivity().checkConnectivity();
    _apiStateListener.onNoNetWork(result);

    if(result== ConnectivityResult.none){
      return false;
    }else if(result== ConnectivityResult.mobile){
      return true;
    }else if(result== ConnectivityResult.wifi){
      return true;
    }
  }

}