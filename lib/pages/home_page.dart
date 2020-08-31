import 'package:apitest/model/api_model.dart';
import 'package:apitest/view_model/view_model.dart';
import 'package:apitest/widgets/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _formKey = GlobalKey();

  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    ViewModel _viewModel = Provider.of<ViewModel>(context);

    return Scaffold(
        body: body()
    );
    /*SingleChildScrollView(
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
        ),*/
  }

  Widget body(){
    ViewModel _viewModel = Provider.of<ViewModel>(context,listen: false);
    return FutureBuilder<ApiModel>(
      future: _viewModel.getData(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  // AppBar
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "1903 Haber",
                            style: GoogleFonts.ubuntu(
                              fontSize: 22,
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            child: Image.asset("assets/img/logo.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Tarih
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "${DateTime.now().day}/"
                            "${DateTime.now().month<10?"0"+DateTime.now().month.toString():DateTime.now().month}/"
                            "${DateTime.now().year}",
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: Colors.grey.shade400
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Haberler",
                        style: GoogleFonts.ubuntu(
                            fontSize: 38,
                            color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Haber Ara
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff12060C).withAlpha(100),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            maxLines: 1,
                            maxLength: 100,
                            validator: _searchValid,
                            onSaved: (value) {
                              _searchText = value;
                            },
                            autofocus: false,
                            style: TextStyle(color: Colors.grey.shade200),
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: "Haber Ara",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                fontSize: 20
                              ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState.validate()){
                                    _formKey.currentState.save();
                                    //todo haber ara
                                    print("Haber Aranıyor.. \n $_searchText");
                                  }
                                },
                                child: Icon(
                                  FlutterIcons.send_circle_mco,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Haberler
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: snapshot.data.news.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              NewsCard(news: snapshot.data.news[index]),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Color(0xff6F525D)
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/bg.png"),
                      fit: BoxFit.fill
                  )
              ),
            ),
          );
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text("Yükleniyor")
              ],
            ),
          );
        }
      },
    );
  }


  String _searchValid(String value) {
    if(value.length>0){
      return null;
    }else{
      return "Geçerli Metin Giriniz.";
    }
  }
}
