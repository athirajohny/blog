import 'package:blog/view/post_details.dart';
import 'package:blog/view_model/home_view_model.dart';
import 'package:blog/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Posts App",style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Container(
        child: postList(),
      ),
    );
  }
}

postList() {
return Consumer<HomeViewModel>(
    builder: (BuildContext context,value,Widget child){
      if (value.status == "loading") {
        Provider.of<HomeViewModel>(context, listen: false)
            .getPosts();
        return Container(
          height: MediaQuery.of(context).size.height*0.9,
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
          child: ListView.builder(
              //itemCount: value.postData.,
              itemBuilder: (context, index) {

                //final PostData post = posts[index];

                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostDetail()),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text(value.postData.title),
                      subtitle: Text(value.postData.body),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              }),
        );
      }

  }
);
}



// ListView(
// padding: const EdgeInsets.all(8),
// children: <Widget>[
// Container(
// height: 100,
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.lightBlueAccent.shade100,
// ),
// borderRadius: BorderRadius.all(Radius.circular(10))
// ),
// // decoration: BoxDecoration(
// //     borderRadius: BorderRadius.all(Radius.circular(20)),
// // ),
// child: const Center(child: Text('Entry A')),
// ),
// ],
//
// ),