import 'package:http/http.dart' as http;


const urlBase = 'http://127.0.0.1/datagame/';

class Request{
  final String? url;
  final dynamic body;

  Request({this.url,this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(urlBase+url!), body: body).timeout(const Duration(minutes: 2));
  }

  Future<http.Response> get(){
    return http.get(Uri.parse(urlBase+url!)).timeout(const Duration(minutes: 2));
  }
}