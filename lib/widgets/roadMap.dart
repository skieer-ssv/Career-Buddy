import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RoadMap extends StatelessWidget {
  final List<String> path;
  final List<String> duration;
  RoadMap(this.duration, this.path);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: path.length,
          itemBuilder: (conte, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 80.0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.purple,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              path[index],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: Colors.black,
                                      ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(14.0, 10, 0, 10.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 70.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.5),
                                color: index < (path.length - 1)
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(
                                    bottom: 10.0,
                                    left: 32.0,
                                  ),
                                  child: Text(
                                    duration[index] + ' years',
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 200.0),
                                  child: RaisedButton(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30.0,
                                      vertical: 12.0,
                                    ),
                                    onPressed: () {},
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Color(0xffF39C12),
                                    child: Text(
                                      'Add to Goal',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
