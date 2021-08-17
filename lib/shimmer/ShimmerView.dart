import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

ShimmerView(BuildContext context) {
  getSpace(value) {
    var returnValue = "";
    for (var i = 0; i <= value; i++) {
      returnValue = returnValue + " ";
    }
    return returnValue;
  }

  return Container(
      child: Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
//                        period: Duration(seconds:5),
          child: Column(
            children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                .map((_) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                        margin: EdgeInsets.only(left: 12, right: 12),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            offset: Offset(0, 5),
                            blurRadius: 2.0,
                          )
                        ], borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              offset: Offset(0, 5),
                              blurRadius: 2.0,
                            )
                          ], borderRadius: BorderRadius.circular(12.0)),
                          key: UniqueKey(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 4,
                              // ),
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(43),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                      )),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${getSpace(25)}",
                                          style: TextStyle(
                                              backgroundColor:
                                                  Color.fromRGBO(0, 0, 0, 0.3)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${getSpace(50)}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              backgroundColor:
                                                  Color.fromRGBO(0, 0, 0, 0.3)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${getSpace(40)}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              backgroundColor:
                                                  Color.fromRGBO(0, 0, 0, 0.3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))))
                .toList(),
          ),
          baseColor: Colors.grey[400],
          highlightColor: Colors.grey[100]));
}
