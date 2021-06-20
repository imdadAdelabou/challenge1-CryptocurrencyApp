import "package:http/http.dart" as http;
import "dart:convert";

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url});
  dynamic body;

  getData(String route) async {
    String completeRoute = "$url$route";
    print(completeRoute);
    http.Response response = await http.get(Uri.parse(completeRoute));
    if (response.statusCode == 200) {
      print("ok");
      return jsonDecode(response.body);
    } else
      throw "Error lors de la communication avec l'api";
  }
}
