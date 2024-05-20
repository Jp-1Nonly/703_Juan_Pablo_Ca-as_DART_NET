import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);

  await for (var request in server) {
    final url = Uri.parse(request.uri.toString().replaceFirst('/proxy/', ''));
    final proxiedRequest = await HttpClient().getUrl(url);
    final proxiedResponse = await proxiedRequest.close();

    proxiedResponse.headers.forEach((name, values) {
      for (var value in values) {
        request.response.headers.add(name, value);
      }
    });

    request.response.statusCode = proxiedResponse.statusCode;
    await proxiedResponse.pipe(request.response);
  }
}
