import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getAccessToken() async {
  const clientId = '4235bc5a42284e6eae31fff9d2bd4399';
  const clientSecret = '67504c5887ec4a9eacf0e32680f48270';
  final tokenUrl = Uri.parse('https://accounts.spotify.com/api/token');

  final response = await http.post(
    tokenUrl,
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'grant_type': 'client_credentials',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final accessToken = data['access_token'];
    return accessToken;
  } else {
    throw Exception('Failed to obtain access token');
  }
}

Future<void> fetchNewReleases() async {
  final accessToken = await getAccessToken();
  final url = Uri.parse('https://api.spotify.com/v1/browse/new-releases');

  final response = await http.get(
    url,
    headers: {'Authorization': 'Bearer $accessToken'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // Process the data as needed
  } else {
    throw Exception('Failed to fetch new releases');
  }
}

