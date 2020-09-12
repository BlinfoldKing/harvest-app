import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/utils/theme.dart';

class SwipeableScaffold extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final List<Widget> pages;
  final List<String> titles;
  final Function(int) onIndex;
  final Function(int page, Function({bool enableAppBar}) update) onTransition;
  final bool enableAppBar;

  const SwipeableScaffold({
    this.items,
    this.pages,
    this.onIndex,
    this.enableAppBar,
    this.onTransition,
    this.titles,
  });

  @override
  _SwipeableScaffold createState() => _SwipeableScaffold(
        items: this.items,
        pages: this.pages,
        enableAppBar: this.enableAppBar,
        onIndex: this.onIndex,
        onTransition: this.onTransition,
        titles: this.titles,
      );
}

class _SwipeableScaffold extends State<SwipeableScaffold> {
  final List<BottomNavigationBarItem> items;
  final List<Widget> pages;
  final List<String> titles;
  final Function(int) onIndex;
  final Function(int page, Function({bool enableAppBar}) update) onTransition;

  bool enableAppBar = false;

  int _page = 0;
  PageController _c;
  @override
  void initState() {
    _c = PageController(
      initialPage: _page,
    );

    super.initState();
  }

  void setAppbarVisibility(bool status) {
    setState(() {
      this.enableAppBar = status;
    });
  }

  _SwipeableScaffold({
    this.items,
    this.pages,
    this.onIndex,
    this.enableAppBar,
    this.onTransition,
    this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.enableAppBar
          ? HarvestAppBar(
              title: this.titles[this._page],
            )
          : null,
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

          if (this.onIndex != null) {
            this.onIndex(this._page);
          }

          if (this.onTransition != null) {
            this.onTransition(this._page, ({bool enableAppBar}) {
              setState(() {
                this.enableAppBar = enableAppBar;
              });
            });
          }
        },
        children: this.pages,
      ),
    );
  }
}
