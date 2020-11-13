import 'package:flutter/material.dart';

class MovieRecommendationCart extends StatelessWidget {
  final colorWhite = Colors.white;
  final Map<String, String> map;

  const MovieRecommendationCart({Key key, @required this.map})
      : assert(map != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myMovieRecommendationCart;
  }

  Widget get _myMovieRecommendationCart {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            _movieCartImage,
            _movieCartDescription,
          ],
        ),
      ),
    );
  }

  Widget get _movieCartImage {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
        child: Image.asset(
          'assets/images/' + map['image'],
          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ));
  }

  Widget get _movieCartDescription {
    return Flexible(
      child: Container(
        height: 130,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          color: Colors.white12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              map['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              map['description'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.lightBlueAccent),
                  child: Text(
                    map['publishDate'],
                    style: TextStyle(fontSize: 10, color: colorWhite),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
