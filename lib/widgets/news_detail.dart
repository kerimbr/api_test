import 'package:apitest/model/news.dart';
import 'package:apitest/utils/api_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';


class NewsDetails extends StatefulWidget {

  News news;


  NewsDetails({@required this.news});

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    News news = widget.news;
    DateTime createdTime = DateTime.parse(news.created_date);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Haber Görseli ve Appbar
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            iconTheme: IconThemeData(
              color: Colors.deepOrange
            ),
            snap: true,
            backgroundColor: Colors.white,
            title: Text(
              "${news.title}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.deepOrange
              ),
            ),
            actionsIconTheme: IconThemeData(opacity: 0.0),
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.network(
                      "${ApiDetails.webSiteUrl}${news.image}",
                      fit: BoxFit.fitWidth,
                    ))
              ],
            ),
          ),

          // haber Detayları
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(height: 10),
                // Buttonlar
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(
                        Entypo.share,
                        color: Colors.blue,
                      ),
                      onPressed: (){

                      },
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Entypo.link,
                        color: Colors.red,
                      ),
                      onPressed: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "• ${createdTime.day}/"
                        "${createdTime.month<10?"0"+createdTime.month.toString():createdTime.month}/"
                        "${createdTime.year} - ${createdTime.hour}:${createdTime.minute} • Oluşturuldu •",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey.shade600
                    ),
                  ),
                ),
                SizedBox(height: 15),

                //Başlık
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "${news.title}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey.shade700,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // İçerik
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      "${news.content}",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ]
            ),
          ),
        ],
      ),
    );

  }
}
