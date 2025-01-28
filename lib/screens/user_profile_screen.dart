import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                //pinned: true,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18, top: 18),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  )
                ],
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                          color: Color(0xff1c1f2e),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                    )),
                foregroundColor: Color(0xff1c1f2e),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item7.png',
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Color(0xff1c1f2e),
                expandedHeight: 170,
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: TapBarViewDeligate(TabBar(
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicatorPadding: EdgeInsets.only(bottom: 4),
                      indicatorColor: Color(0xffF35383),
                      tabs: [
                        Tab(
                          icon: Image.asset('images/icon_tab_posts.png'),
                        ),
                        Tab(
                          icon: Image.asset('images/icon_tab_bookmark.png'),
                        )
                      ])))
            ];
          },
          body: TabBarView(children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(
                              'images/item$index.png',
                            ),
                          ),
                        ),
                      );
                    }, childCount: 10),
                    gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ]),
                  ),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(
                              'images/item$index.png',
                            ),
                          ),
                        ),
                      );
                    }, childCount: 10),
                    gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ]),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xffF35383)),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سید مهدی موسویان',
                style: TextStyle(
                    fontFamily: 'SM', color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                'Mosavian Mahdi',
                style: TextStyle(
                    fontFamily: 'GB', color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TapBarViewDeligate extends SliverPersistentHeaderDelegate {
  TapBarViewDeligate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Color(0xff1c1f2e), child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
