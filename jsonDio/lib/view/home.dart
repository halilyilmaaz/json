import 'package:flutter/material.dart';
import 'package:jsondio/model/article_model.dart';
import 'package:jsondio/model/newsResponse_model.dart';
import 'package:jsondio/services/dio_services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DioServices dioServices = DioServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical:25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "News",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold)
              ),
              Text(
                "News are here always",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)
              ),
              Expanded(child: FutureBuilder<List<Article?>?>(
                future: DioServices().fetchNewsArticle(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                //let's add the height

                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data![index]!.urlToImage.toString()), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  snapshot.data![index]!.author.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                snapshot.data![index]!.title.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                          ],
                        ),
                      );
                    });
                  }
                }))
            ],
          ),
        ),
      ),
    );
  }
}