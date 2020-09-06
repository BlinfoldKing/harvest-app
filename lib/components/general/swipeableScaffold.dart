import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class SwipeableScaffold extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final List<Widget> pages;

  const SwipeableScaffold({this.items, this.pages});

  @override
  _SwipeableScaffold createState() =>
      _SwipeableScaffold(items: this.items, pages: this.pages);
}

class _SwipeableScaffold extends State<SwipeableScaffold> {
  final List<BottomNavigationBarItem> items;
  final List<Widget> pages;

  int _page = 0;
  PageController _c;
  @override
  void initState() {
    _c = PageController(
      initialPage: _page,
    );

    super.initState();
  }

  _SwipeableScaffold({this.items, this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: HarvestTheme.purple,
        unselectedItemColor: HarvestTheme.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: (index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        items: this.items,
      ),
      body: new PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: this.pages,
      ),
    );
  }
}
