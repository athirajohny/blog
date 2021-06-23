import 'package:blog/utility/graphQl.dart';
import 'package:blog/utility/query_mutation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiProvider{
 QueryMutation addMutation = QueryMutation();

 getPosts() async {
  //Posts posts;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  QueryResult result = await _client.mutate(
   MutationOptions(document: gql(addMutation.postsQuery()),
   ),
  );
  if (result.hasException) {
   print('Exception in api_provider.dart');
  } else {
   //_posts = Posts.fromJson(result.data["postsQuery"]);
  }

 }

 }