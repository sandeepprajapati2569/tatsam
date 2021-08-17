import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tatsam/helper/db_helper.dart';
import 'package:tatsam/screens/home/Model/CountryModel.dart';
import 'package:tatsam/screens/home/ui/country_listView.dart';
import 'package:tatsam/shimmer/ShimmerView.dart';

class FavroiteList extends StatefulWidget {
  @override
  _FavroiteListState createState() => _FavroiteListState();
}

class _FavroiteListState extends State<FavroiteList> {
  bool dbIsPresent;
  @override
  void initState() {
    checckDbStatus();
    // TODO: implement initState
    super.initState();
  }

  checckDbStatus() async {
    DbHelper().dbIsEmpty().then((value) => setState(() {
          dbIsPresent = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: dbIsPresent == true
              ? FutureBuilder<List<CountryModel>>(
                  future: DbHelper().getMapList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CountryModel> countryList = snapshot.data;
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: countryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            CountryModel countryModel = countryList[index];
                            return CountryListView(
                              countryModel: countryModel,
                              ifFavroite: true,
                            );
                          });
                    } else {
                      return SingleChildScrollView(child: ShimmerView(context));
                    }
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/noData.svg",
                        height: 100,
                      ),
                      Text(
                        "Sorry no data found",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )),
    );
  }
}
