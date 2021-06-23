import 'package:blog/view/home.dart';
import 'package:blog/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog/utility/graphQl.dart';
import 'package:provider/provider.dart';

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
    return ScreenUtilInit(
      builder: ()=>MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: HomeViewModel()),
          ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}

