import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scroll_ex/models/post.dart';

class JsonPlaceholder {
  static Future<List<Post>> getPosts() async {
    try {
      final http.Response response = await http.get('https://jsonplaceholder.typicode.com/posts');

      final responseBody = json.decode(response.body);

      final List<Post> posts = responseBody.map<Post>((json) => Post.fromJson(json)).toList();

      // 100개의 아이템을 읽어오므로 너무 많아서 5개로 줄임.
      posts.removeRange(5, posts.length);

      // await Future.delayed(Duration(seconds: 3));

      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
