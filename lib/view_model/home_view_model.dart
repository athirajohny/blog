import 'dart:developer';
import 'package:blog/repository/posts_repository.dart';
import 'package:blog/response_handler/post.dart';
import 'package:blog/utility/query_mutation.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{
  QueryMutation addMutation = QueryMutation();
  String status = "loading";
  PostData _postData;
  PostData get postData{
    return _postData;
  }
  final PostsRepository postsRepository = PostsRepository();

  getPosts() async{
  var resultsData = await postsRepository.getPosts();
  status = resultsData["status"];
  log(status);
  log(resultsData["value"].toString());
  if(status == "completed"){
    _postData = PostData.fromJson(resultsData["value"]);
  }
  notifyListeners();
  }
  changeStatus(statusData) {
    status = statusData;
    notifyListeners();
  }
}