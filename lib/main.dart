import 'package:blog/view/home.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog/utility/graphQl.dart';

void main() async{
  await initHiveForFlutter();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  runApp(
      GraphQLProvider(
          client: graphQLConfiguration.initailizeClient(),
          child: MyApp()
      )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

