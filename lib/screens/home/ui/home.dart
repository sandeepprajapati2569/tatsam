import 'package:flutter/material.dart';
import 'package:tatsam/screens/home/Model/CountryModel.dart';
import 'package:tatsam/screens/home/repository/repository.dart';
import 'package:tatsam/screens/home/ui/country_listView.dart';
import 'package:tatsam/screens/home/ui/favroiteList.dart';
import 'package:tatsam/shimmer/ShimmerView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavroiteList()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              color: Colors.green[100],
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Favorite",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ))),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: 35,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Tatsam",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<CountryModel>>(
                future: Repository().getCountryList(),
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
                            ifFavroite: false,
                          );
                        });
                  } else {
                    return SingleChildScrollView(child: ShimmerView(context));
                  }
                }),
          ),
        ],
      )),
    );
  }
}
