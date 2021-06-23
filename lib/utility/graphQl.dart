
import 'package:blog/utility/api_endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class GraphQLConfiguration{
  HttpLink httpLink = HttpLink((ApiEndpoint()).graphQlUrl),

  ValueNotifier<GraphQLClient> initailizeClient(){
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link : httpLink, //or link
        cache : GraphQLCache(store: HiveStore()),
      )
    );
    return client;
  }

  GraphQLClient clientToQuery(){
    return GraphQLClient(
      link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
    );
  }
}