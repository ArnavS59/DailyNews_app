import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/models/Category.dart';

class Home extends StatefulWidget {
//  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Daily"),
                Text(
                  "News",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[500],
                  ),
                ),
              ]),
          elevation: 5,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      categoryName: categories[index].categoryName,
                      imageURl: categories[index].imageUrl,
                    );
                  }),
            )
          ],
        )));
  }
}

class CategoryItem extends StatelessWidget {
//  const CategoryItem({Key key}) : super(key: key);

  final imageURl;
  final String categoryName;

  CategoryItem({this.imageURl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageURl,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              width: 120,
              height: 70,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  //const BlogItem({Key key}) : super(key: key);

  final String imageUrl, title, description;
  BlogItem({
    @required this.description,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
