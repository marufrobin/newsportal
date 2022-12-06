import 'package:flutter/material.dart';
import 'package:newsportal/customhttp/custom_http.dart';
import 'package:newsportal/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Portal"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.red,
            ),
            Container(
              height: 80,
            ),
            FutureBuilder<List<Articles>>(
              future: CustomHttp().fetchingNewsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Somthing error");
                } else if (snapshot.data == null) {
                  return Text("No Data found");
                }
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Image.network("${snapshot.data![index].urlToImage}"),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
