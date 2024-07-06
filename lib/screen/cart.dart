import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/model.dart';

class Quickscreen extends StatefulWidget {
  const Quickscreen({super.key});

  @override
  _QuickscreenState createState() => _QuickscreenState();
}

class _QuickscreenState extends State<Quickscreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    QuickContent(),
    Text(
      'Search',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.teal[500],
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}

class QuickContent extends StatelessWidget {
  const QuickContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: const Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Quick & Easy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: const Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: rootBundle.loadString('assets/jsondata.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error loading data'),
                );
              } else if (snapshot.hasData) {
                List<dynamic> jsonDatalist = jsonDecode(snapshot.data!);
                List<DataModel> dataList = jsonDatalist.map((json) => DataModel.fromJson(json)).toList();

                return SizedBox(
                  height: 620,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dataList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.2,
                        mainAxisExtent: 240),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 125,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      dataList[index].image,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            dataList[index].title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.local_fire_department_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${dataList[index].rating.rate} Rating.',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.access_time,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                '${dataList[index].rating.count} Reviews.',
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text(
                                '${dataList[index].rating.rate}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' (${dataList[index].rating.count} Reviews)',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
