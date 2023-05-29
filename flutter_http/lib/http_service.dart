import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class HttpService {
  Future<List<Post>> getPosts() async {
    const String postsURL = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(postsURL));
    // if (kDebugMode) {
    //   print(response.statusCode);
    //   print("\nDebugging Response Check \n");
    //   print(response.body);
    // print(response.runtimeType);
    // }

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();
      print(body.runtimeType);
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
