import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = "dtfqc1o8z";
  static const String uploadPreset = "movie_app";

  Future<String> uploadImage(File image) async {
    final uri = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
    );

    final request = http.MultipartRequest("POST", uri);

    request.fields["upload_preset"] = uploadPreset;

    request.files.add(
      await http.MultipartFile.fromPath(
        "file",
        image.path,
      ),
    );

    final response = await request.send();

    final body = await response.stream.bytesToString();

    print("Status Code: ${response.statusCode}");
    print("Cloudinary Response: $body");

    if (response.statusCode == 200) {
      final data = jsonDecode(body);
      return data["secure_url"];
    }

    throw Exception(body);
  }
}