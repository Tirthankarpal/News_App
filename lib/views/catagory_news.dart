import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../helper/news.dart';
import 'article_view.dart';

class CatagoryNews extends StatefulWidget {
  final String category;

  const CatagoryNews({super.key, required this.category});

  @override
  State<CatagoryNews> createState() => _CatagoryNewsState();
}

class _CatagoryNewsState extends State<CatagoryNews> {
  List<ArticleModel> articleModel = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CatagoryNewsClass newsClass = CatagoryNewsClass();
    await newsClass.getNews(widget.category);
    articleModel = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Daily',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'News'),
            ],
          ),
        ),
      ),
      body:
          _loading
              ? Center(child: Container(child: CircularProgressIndicator()))
              : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
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

