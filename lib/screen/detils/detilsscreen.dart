
import 'package:exam_advance/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../compones/bottombar.dart';
import '../compones/img.dart';
import '../compones/name.dart';




class ProductScreen extends StatelessWidget {
  ProductScreen(
      {super.key, required this.mainModal, required this.productIndex});

  DataModel mainModal;
  int productIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(),
  appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productImage(mainModal, productIndex),
                name_Prize(mainModal, productIndex),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
