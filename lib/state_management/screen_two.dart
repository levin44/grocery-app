import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/state_management/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({
    super.key,
    //required this.counter,
  });

  //final int counter;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText("Screen two"),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              // setState(() {
              //   _counter++;
              // });
            },
            text: "Add +",
          ),
          SizedBox(height: 30),
          CustomText(Provider.of<CounterProvider>(context).counter.toString()),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              // setState(() {
              //   _counter--;
              // });
            },
            text: "Sub -",
          ),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            text: "go to screeen two",
          ),
        ],
      )),
    );
  }
}
