import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomsheet extends StatelessWidget {
  const ShareBottomsheet({super.key, this.controller});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 22),
                  height: 5,
                  width: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: TextStyle(
                          fontFamily: 'GB', color: Colors.white, fontSize: 20),
                    ),
                    Image.asset('images/icon_share_bottomsheet.png')
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('images/icon_search.png'),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search User',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: 100,
                  ((context, index) {
                return Container(
                  color: Colors.yellow,
                );
              })),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              )),
        ],
      ),
    );
  }
}
