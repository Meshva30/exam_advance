import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/api_controller.dart';
import '../../utils/list.dart';
import '../detils/detilsscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'What are you',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Cooking today?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xffFEFEFE),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.notifications_outlined),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 420,
                  decoration: BoxDecoration(
                    color: const Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search any Product...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/bg.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      tabbar_container(list[index], index),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Quick & Easy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
              Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.mainModal.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  } else {
                    return SizedBox(
                      height: 560,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            mainAxisExtent: 250),
                        itemCount: provider.mainModal.length,
                        itemBuilder: (context, index) {
                          var datamodel = provider.mainModal[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                        mainModal: datamodel,
                                        productIndex: index),
                                  ));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 125,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            datamodel.image,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  datamodel.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${datamodel.price}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    Text(
                                      '${datamodel.rating.rate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '(${datamodel.rating.count} Reviews)',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tabbar_container(String text, int index) {
  return Container(
    margin: const EdgeInsets.all(5),
    height: 40,
    width: 80,
    decoration: BoxDecoration(
        color: (index == 0) ? Colors.teal : const Color(0xffFEFEFE),
        borderRadius: BorderRadius.circular(20)),
    child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: (index == 0) ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        )),
  );
}