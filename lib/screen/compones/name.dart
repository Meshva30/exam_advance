import 'package:flutter/material.dart';

import '../../model/model.dart';

Center name_Prize(DataModel datamodel, int productIndex) {
  return Center(
    child: Column(
      children: [
        Container(
          height: 830,
          width: 420,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0xffFEFEFE)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '02',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          '+',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  Text(
                    '${datamodel.rating.rate}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '(${datamodel.rating.count} Reviews)',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${datamodel.price}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                datamodel.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                datamodel.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ],
    ),
  );

}
