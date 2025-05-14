import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/catagory_model.dart';

import '../helper/data.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import 'article_view.dart';
import 'catagory_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatagoryModel> catagories = <CatagoryModel>[];
  List<ArticleModel> articleModel = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catagories = getCatagories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articleModel = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('News'),
          ],
        ),
      ),
      body:
          _loading
              ? Center(child: Container(child: CircularProgressIndicator()))
              : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      //Catagories
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemCount: catagories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: catagories[index].imageUrl,
                                catagoryName: catagories[index].catagoryName,
                              );
                            },
                          ),
                        ),
                      ),
                      //Blogs
                      Container(
                        child: ListView.builder(
                          itemCount: articleModel.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articleModel[index].urlToImage,
                              title: articleModel[index].title,
                              desc: articleModel[index].description,
                              url: articleModel[index].url,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, catagoryName;

  const CategoryTile({
    super.key,
    required this.imageUrl,
    required this.catagoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => CatagoryNews(category: catagoryName.toLowerCase(),)
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: 120,
        height: 80,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                catagoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)),
        );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(desc, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
