import 'dart:convert';
import 'dart:io';

import 'package:bloc_practice/Models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRespository {

  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
              userId: e['userId'],
              id: e['id'],
              title: e['title'],
              body: e['body']);
        }).toList();
      }
    } on SocketException{
      throw Exception("error while fetching data");
    }

    throw Exception("error while fetching data");
    
  }
}
