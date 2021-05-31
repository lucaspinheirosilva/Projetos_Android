import 'package:carrousel/slide_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;
  var _listSlide = [
    {'id': 0, 'image': '/images/img1.jpg'},
    {'id': 1, 'image': '/images/img2.jpg'},
    {'id': 2, 'image': '/images/img3.jpg'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            child: PageView.builder(
          controller: _pageController,
          itemCount: _listSlide.length,
          itemBuilder: (context, currentIndex) {
            bool activePage = currentIndex == _currentPage;
            return SlideTile(
              activePage: activePage,
              image: _listSlide[currentIndex]['image'],
            );
          },
        )),
        _buildDotBullet()
      ],
    ));
  }

  Widget _buildDotBullet() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(i['id']);
                _currentPage = i['id'];
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: _currentPage == i['id'] ? 20 : 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: _currentPage == i['id'] ? Colors.red : Colors.grey),
            ),
          );
        }).toList(),
      ),
    );
  }
}
