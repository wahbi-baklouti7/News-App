import 'package:flutter/material.dart';

Widget buildArticleItem(article,context) {
  String date = article["publishedAt"];
  date = date.substring(0, 10) + "  " + date.substring(12, 16);

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("${article["urlToImage"]}"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("${article["title"]}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:Theme.of(context).textTheme.subtitle1),
                ),
                Text("$date",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
          ),
        )
      ],
    ),
  );
}


Widget articleBuilder(List list,context) {
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => Divider(
      height: 1,
      color: Colors.grey,
    ),
    itemCount: list.length,
    itemBuilder: (BuildContext context, index) {
      return buildArticleItem(list[index],context);
    },
  );
}
