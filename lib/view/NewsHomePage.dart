import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/service/NewsService.dart';
import 'package:news/view/DetailsNewsScreen.dart';

import '../news_model/NewsModel.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: CupertinoColors.black, size: 30),
          actions: [
            SizedBox(
              width: width * 0.05,
            ),
            Icon(
              Icons.menu,
            ),
            Spacer(),
            Image.asset(
              'assets/images/2.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: width * 0.05,
            ),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            indicatorColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
            isScrollable: true,
            tabs: [
              Text(
                "HOME",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "NEWS",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "SHOWS",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "EXTRA",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "STYLE",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          )),
      body: TabBarView(controller: tabController, children: [
        FutureBuilder(
          future: NewsService.NewGetData(),
          builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  final news = snapshot.data!.articles![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsNewsScreen(
                                    image: news.urlToImage,
                                    title: news.title,
                                    content: news.content,
                                    description: news.description,
                                    author: news.author,
                                    url: news.url),
                              ));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: height * 0.15,
                              width: height * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      news.urlToImage == null
                                          ? "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg"
                                          : snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    news.publishedAt.toString().split('')[0],
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * 0.07,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 30,
                ),
              );
            }
          },
        ),
        FadeInLeft(
          child: Center(
            child: Text(
              "NEWS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        FadeInRight(
          child: Center(
            child: Text(
              "SHOWS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        FadeInLeftBig(
          child: Center(
            child: Text(
              "EXTRA",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        FadeInRightBig(
          child: Center(
            child: Text(
              "STTLE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ]),
    );
  }
}
