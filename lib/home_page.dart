import 'package:apitest/model/api_model.dart';
import 'package:apitest/view_model/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ViewModel _viewModel = Provider.of<ViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Api Test"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<ApiModel>(
            future: _viewModel.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Divider(),
                    Text(
                      "Tüm Api",
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(),
                    Divider(),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 15),
                    ),
                    Divider(),
                    Text("${snapshot.data.search}"),
                    Divider(),
                    Text(
                      "Pagination",
                      style: TextStyle(fontSize: 15),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${snapshot.data.pagination}",
                        //textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(),
                    Text(
                      "News",
                      style: TextStyle(fontSize: 15),
                    ),
                    Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.news.length,
                      separatorBuilder: (context, i) {
                        return Divider();
                      },
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey.shade200,
                          elevation: 5,
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(
                              "${snapshot.data.news[index].title}",
                              style: TextStyle(color: Colors.red.shade700),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text("${snapshot.data.news[index].content}"),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    SizedBox(height: 30),
                    Text("Veriler Getiriliyor...")
                  ],
                );
              }
            },
          ),
        ));
  }
}
