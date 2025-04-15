import 'package:flutter/material.dart';

Widget cardFrontView(
    {required BuildContext context,
    String? cardNumber,
    String? cardHoldername}) {
  String formatCardNumber(String? input) {
    String raw = input?.replaceAll(' ', '') ?? '';

    // Pad the number with * if less than 16 digits
    raw = raw.padRight(16, '*');

    // Format into groups of 4
    return '${raw.substring(0, 4)} ${raw.substring(4, 8)} ${raw.substring(8, 12)} ${raw.substring(12, 16)}';
  }

  return Card(
    surfaceTintColor: Colors.blueAccent,
    
    elevation: 10,
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        children: [
          //visa image
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/visa-logo.png",
              alignment: Alignment.topRight,
              width: 60,
              height: 40,
            ),
          ),

          //card number
          Text(
            formatCardNumber(cardNumber),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //card holder
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    Text(
                      "Card Holder",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),

                    //text
                    Text(
                      cardHoldername ?? "Abhishek Kumar",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),

                //expire
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    Text(
                      "Expiry",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),

                    //text
                    Text(
                      "04/25",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
