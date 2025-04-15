import 'package:flutter/material.dart';

Widget cardBackView({required BuildContext context, String? cvv}) {
  return Card(
    surfaceTintColor: Colors.blueAccent,
    elevation: 10,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          //black strip
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 45,
          ),

          //grey stip and cvv
          Row(
            children: [
              //grey strip
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.grey.shade700,
                width: 200,
                height: 40,
              ),

              //cvv
              Text(
                cvv ?? '',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //two grey strip
                  Container(
                    color: Colors.grey.shade500,
                    width: 120,
                    height: 20,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey.shade500,
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
