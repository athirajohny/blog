import 'package:blog/response_handler/post.dart';
import 'package:blog/view_model/details_view_model.dart';
import 'package:blog/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatefulWidget {
  final String id;
  const PostDetail({Key key,@required this.id}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: postdetails(),
      ),
    );
  }
}

postdetails() {
  return Consumer(
      builder: (BuildContext context,value,Widget child) {
        if (value.status == "loading") {
          Provider.of<DetailsViewModel>(context, listen: false)
              .getDetails();
          return Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.9,
            child: Center(
              child: Loading(),
            ),);
        }
        else if (value.status == "empty") {
          return SizedBox.shrink();
        } else if (value.status == "error") {
          return SizedBox.shrink();
        } else {
          return Container(
            child: Center(child: Text("${value.author.email}")),
          );
        }
      }
  );
}
