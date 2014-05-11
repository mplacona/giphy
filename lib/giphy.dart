library giphy;
import 'package:http/http.dart' as http;
import 'dart:async';

class Giphy {
    final baseUri = "api.giphy.com/v1/gifs";
    String apiKey;
    Map<String, String> parameters;

    Giphy(this.apiKey){
        parameters = {'api_key' : this.apiKey};
    }
    
    Future search(String query){
        parameters['q'] = query;
        return _apiRequest('search', parameters).then((msg) => msg);
    }
    
    Future translate(String s) {
        parameters['s'] = s;
        return _apiRequest('translate', parameters).then((msg) => msg);
    }
    
    Future random(String tag) {
        parameters['tag'] = tag;
        return _apiRequest('random', parameters).then((msg) => msg);
    }
    
    Future trending() {
        return _apiRequest('trending', parameters).then((msg) => msg);
    }
    
    Future _apiRequest(String method, Map<String, String> parameters) {
        return http.get(_buildUri(method, parameters).toString());
    }
    
    Uri _buildUri(String method, Map<String, String> queryParameters){
        var uri = new Uri.http(baseUri, method, queryParameters);
        return uri;
    }
  
    String _processResults(http.Response value) {
        return value.body;
    }
  
    _handleError(Error error){
        print('hjhj');
    }
  
  
}