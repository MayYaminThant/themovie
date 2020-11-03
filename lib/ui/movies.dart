import 'package:flutter/material.dart';
import '../ui/search.dart';

class MyMovies extends StatefulWidget {
  @override
  _MyMoviesState createState() => _MyMoviesState();
}

class _MyMoviesState extends State<MyMovies> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _settingBtn,
            _movieBody,
            _searchView,
            _textView,
            _recommendationMovieList,
          ],
        ),
      ),
    );
  }

  Widget get _movieBody {
    return Center(
      child: SizedBox(
        height: 200, // card height
        child: _pageViewer,
      ),
    );
  }

  Widget get _pageViewer {
    return PageView.builder(
      itemCount: 10,
      controller: PageController(viewportFraction: 0.7),
      onPageChanged: (int index) => setState(() => _index = index),
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == _index ? 1 : 0.9,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Card ${i + 1}",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _settingBtn {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.settings,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  Widget get _searchView {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
        ),
      ),
    );
  }

  Widget get _textView {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Recommendations", style: TextStyle(color: Colors.white)),
    );
  }

  Widget get _recommendationMovieList {
    List<String> list = ["AA", "BB"];
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext builderContext, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_filter,
                  color: Colors.white,
                ),
                title: new Text(
                  list[index],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: new Text(
                  list[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
