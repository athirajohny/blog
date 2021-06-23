import 'dart:developer';
import 'package:blog/repository/details_repository.dart';
import 'package:blog/response_handler/author.dart';
import 'package:blog/utility/query_mutation.dart';
import 'package:flutter/material.dart';

class DetailsViewModel with ChangeNotifier{
  QueryMutation addMutation = QueryMutation();
  String status = "loading";
  Author _author;
  Author get author{
    return _author;
  }
  final DetailsRepository detailsRepository = DetailsRepository();

  getDetails() async{
    var resultsData = await detailsRepository.getDetails();
    status = resultsData["status"];
    log(status);
    log(resultsData["value"].toString());
    if(status == "completed"){
      _author = Author.fromJson(resultsData["value"]);
    }
    notifyListeners();
  }
  changeStatus(statusData) {
    status = statusData;
    notifyListeners();
  }
}