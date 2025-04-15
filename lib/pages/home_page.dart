import 'dart:math';

import 'package:card_animation/widgets/card_back_view.dart';
import 'package:card_animation/widgets/card_front_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // double rotationValue = 0.0;
  String cardNumber = '';
  String cardHolderName = '';
  String cvv = '';
  final FocusNode cvvFocusNode = FocusNode();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    cvvFocusNode.addListener(
      () {
        if (cvvFocusNode.hasFocus) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * .8,
          height: size.height * .7,
          child: Card(
            elevation: 3,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //card
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateY(pi * _animation.value),
                          // origin: Offset(0, 0),
                          child: SizedBox(
                            width: size.width * .3,
                            height: size.height * .35,
                            child: _animation.value < 0.5
                                ? cardFrontView(
                                    context: context,
                                    cardHoldername: cardHolderName,
                                    cardNumber: cardNumber,
                                  )
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(pi),
                                    child: cardBackView(
                                        context: context, cvv: cvv),
                                  ),
                          ),
                        );
                      }),

                  //tetx fields
                  //text fields
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 16,
                              onChanged: (value) {
                                setState(() {
                                  cardNumber = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Card Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              maxLength: 20,
                              onChanged: (value) {
                                setState(() {
                                  cardHolderName = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Cardholder Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              focusNode: cvvFocusNode,
                              maxLength: 3,
                              onChanged: (value) {
                                setState(() {
                                  cvv = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
