import 'package:flutter/material.dart';

import '../../model/model.dart';

Column productImage(DataModel datamodel, int productIndex) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  datamodel.image,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
