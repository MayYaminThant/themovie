import 'package:flutter/material.dart';
import '../ui/search_page.dart';
import 'movie_recommendation_cart.dart';

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
            // _recommendationMovieList,
            _recommendationMovieListTwo,
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
    var list = [
      {
        'image': 'black-panther-web.jpg',
        'name': 'Black Panther',
        'description':
            '‘Black Panther’ is exhilarating, groundbreaking and more than worth the wait',
        'publishDate': 'Feb 10, 2018'
      },
      {
        'image': 'frozen.jpg',
        'name': 'Frozen',
        'description':
            'Elsa and Anna live happily ever after in Eranda, but one unlucky day comes. With Elsa alone, Anna and Christopher, O\'Leary, With Savannah, I had to find the truth of the past.',
        'publishDate': 'Nov 22, 2019'
      },
      {
        'image': 'how-to-train-your-dragon.jpg',
        'name': 'How To Train Your Dragon',
        'description':
            'As the number of dragons grew in the hacks of the hipsters, the quarrel between the dragon hunters increased, so the hackers sought to find a secret place at the end of the world to keep the dragons and their people safe.',
        'publishDate': 'Feb 22, 2019'
      },
      {
        'image': 'mulan.jpg',
        'name': 'Mulan',
        'description':
            'The film depicts the history of Mulan, a young woman who pretends to be a boy instead of her sick father when summoned veterans from every house during the Chinese War.',
        'publishDate': 'Sep 4 2020'
      },
    ];
    return PageView.builder(
      itemCount: list.length,
      controller: PageController(viewportFraction: 0.5),
      onPageChanged: (int index) => setState(() => _index = index),
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == _index ? 1 : 0.9,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/' + list[i]['image'],
                fit: BoxFit.cover,
              )),
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
          color: Colors.white12,
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

  Widget get _recommendationMovieListTwo {
    final list = [
      {
        'image': 'black-panther-web.jpg',
        'name': 'Black Panther',
        'description':
            '‘Black Panther’ is exhilarating, groundbreaking and more than worth the wait',
        'publishDate': 'Feb 10, 2018'
      },
      {
        'image': 'frozen.jpg',
        'name': 'Frozen',
        'description':
            'Elsa and Anna live happily ever after in Eranda, but one unlucky day comes. With Elsa alone, Anna and Christopher, O\'Leary, With Savannah, I had to find the truth of the past.',
        'publishDate': 'Nov 22, 2019'
      },
      {
        'image': 'how-to-train-your-dragon.jpg',
        'name': 'How To Train Your Dragon',
        'description':
            'As the number of dragons grew in the hacks of the hipsters, the quarrel between the dragon hunters increased, so the hackers sought to find a secret place at the end of the world to keep the dragons and their people safe.',
        'publishDate': 'Feb 22, 2019'
      },
      {
        'image': 'mulan.jpg',
        'name': 'Mulan',
        'description':
        'The film depicts the history of Mulan, a young woman who pretends to be a boy instead of her sick father when summoned veterans from every house during the Chinese War.',
        'publishDate': 'Sep 4 2020'
      },
    ];
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (BuildContext buildercontext, int count) {
          return SizedBox(
            height: 15,
          );
        },
        itemCount: list.length,
        itemBuilder: (BuildContext buildercontext, int count) {
          return MovieRecommendationCart(
            map: list[count],
          );
        },
      ),
    );
  }
}
