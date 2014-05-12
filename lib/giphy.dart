library giphy;
import 'package:http/http.dart' as http;
import 'dart:async';

class Giphy {
    final _baseUri = "api.giphy.com/v1/gifs";
    Map<String, String> _parameters;
    String _apiKey;
    

    Giphy(this._apiKey){
        _parameters = {'api_key' : this._apiKey};
    }
    
    Future search(String query){
        _parameters['q'] = query;
        return _apiRequest('search', _parameters).then((msg) => msg);
    }
    
    Future translate(String s) {
        _parameters['s'] = s;
        return _apiRequest('translate', _parameters).then((msg) => msg);
    }
    
    Future random(String tag) {
        _parameters['tag'] = tag;
        return _apiRequest('random', _parameters).then((msg) => msg);
    }
    
    Future trending() {
        return _apiRequest('trending', _parameters).then((msg) => msg);
    }
    
    Future _apiRequest(String method, Map<String, String> parameters) {
        return http.get(_buildUri(method, parameters).toString());
    }
    
    Uri _buildUri(String method, Map<String, String> queryParameters){
        var uri = new Uri.http(_baseUri, method, queryParameters);
        return uri;
    }  
}