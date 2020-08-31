import 'package:apitest/model/api_model.dart';
import 'package:apitest/model/news.dart';
import 'package:apitest/utils/api_details.dart';
import 'package:apitest/widgets/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatefulWidget {
  News news;

  NewsCard({@required this.news});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    News news = widget.news;
    return Stack(
      children: <Widget>[
        Card(
          elevation: 5,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 330,
            height: 330,
            child: Column(
              children: <Widget>[
                // Haber Fotoğrafı
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: NetworkImage("${ApiDetails.webSiteUrl}${news.image}"),
                            fit: BoxFit.fitWidth)),
                  ),
                ),
                // Haber Detayı Özeti
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        //Haber Başlığı
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "${news.title}",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.openSans(
                                color: Colors.grey.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              "${news.content}",
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Tamamını Görmek İçin Dokunun",
                                style: TextStyle(color: Colors.grey.shade300),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                FontAwesome.chevron_circle_right,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Color(0xff957389),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
        ),
        new Positioned.fill(
          child: new Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: new InkWell(
              onTap: () {
                Route r = MaterialPageRoute(
                  builder: (context)=>NewsDetails(news: news)
                );
                Navigator.push(context, r);
              },
            ),
          ),
        ),
      ],
    );
  }
}
