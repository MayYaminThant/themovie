import 'package:flutter/material.dart';

class MyMovieDetail extends StatelessWidget {
  final Map<String, String> map;

  const MyMovieDetail({Key key, @required this.map})
      : assert(map != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myMovieDetailMainBody(context);
  }

  Widget _myMovieDetailMainBody(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: _movieTopPart(context)),
    );
  }

  Widget _movieTopPart(context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/' + map['image'],
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              map['name'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
