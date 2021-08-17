import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tatsam/helper/db_helper.dart';
import 'package:tatsam/screens/home/Model/CountryModel.dart';

class CountryListView extends StatefulWidget {
  bool ifFavroite = false;
  CountryModel countryModel;
  CountryListView({this.countryModel, this.ifFavroite});
  @override
  _CountryListViewState createState() => _CountryListViewState();
}

bool fevorite = false;

class _CountryListViewState extends State<CountryListView> {
  @override
  void initState() {
    setState(() {
      fevorite = widget.ifFavroite;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: 10,
              child: InkWell(
                onTap: () {
                  setState(() {
                    fevorite = !fevorite;
                    DbHelper().insertModel(widget.countryModel);
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: fevorite == false ? Colors.white : Colors.pink,
                ),
              )),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey[500],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: SvgPicture.asset("assets/images/flag.svg",
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Text(widget.countryModel.country,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      Text(widget.countryModel.region,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white)),
                      Text(widget.countryModel.key,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
